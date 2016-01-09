﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using DataProvider.Helpers;

namespace Stuff.Models
{
    public class RecruitCandidate
    {
       public int Id { get; set; }
public string Surname { get; set; }
public string Name { get; set; }
       public string Patronymic { get; set; }
       public string DisplayName { get; set; }
       public bool Male { get; set; }
        public string MaleStr => Male ? "Муж." : "Жен.";
        public DateTime DateCreate { get; set; }
        public string CreatorSid { get; set; }
        public string CreatorName { get; set; }
        public int IdCameResource { get; set; }
        public string CameResourceName { get; set; }
        public DateTime? BirthDate { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }

        public int? Age
        {
            get
            {
                int? age = null;
                if (BirthDate.HasValue && BirthDate.Value.Year > 1900)
                {
                    age = (int)(DateTime.Now - BirthDate.Value).TotalDays/365;
                }
                return age;
            }
        }


        public RecruitCandidate()
        {

        }

        public RecruitCandidate(int id)
        {
            SqlParameter pId = new SqlParameter() { ParameterName = "id", SqlValue = id, SqlDbType = SqlDbType.Int };
            var dt = Db.Stuff.ExecuteQueryStoredProcedure("recruit_candidate_get", pId);
            if (dt.Rows.Count > 0)
            {
                var row = dt.Rows[0];
                FillSelf(row);
            }
        }

        public RecruitCandidate(DataRow row)
            : this()
        {
            FillSelf(row);
        }

        private void FillSelf(DataRow row)
        {
            Id = Db.DbHelper.GetValueIntOrDefault(row, "id");
            CreatorSid = Db.DbHelper.GetValueString(row, "creator_sid");
            CreatorName = Db.DbHelper.GetValueString(row, "creator_name");
            Surname = Db.DbHelper.GetValueString(row, "surname");
            Name = Db.DbHelper.GetValueString(row, "name");
            Patronymic = Db.DbHelper.GetValueString(row, "patronymic");
            DisplayName = Db.DbHelper.GetValueString(row, "display_name");
            Male = Db.DbHelper.GetValueBool(row, "male");
            DateCreate = Db.DbHelper.GetValueDateTimeOrDefault(row, "dattim1");
            IdCameResource = Db.DbHelper.GetValueIntOrDefault(row, "id_came_resource");
            CameResourceName = Db.DbHelper.GetValueString(row, "came_resource_name");
            BirthDate = Db.DbHelper.GetValueDateTimeOrDefault(row, "birth_date");
            Phone = Db.DbHelper.GetValueString(row, "phone");
            Email = Db.DbHelper.GetValueString(row, "email");
        }

        public void Create(string creatorSid)
        {
            DisplayName = Employee.ShortName($"{Surname} {Name} {Patronymic}").Trim();

            SqlParameter pSurname = new SqlParameter() { ParameterName = "surname", SqlValue = Surname, SqlDbType = SqlDbType.NVarChar };
            SqlParameter pName = new SqlParameter() { ParameterName = "name", SqlValue = Name, SqlDbType = SqlDbType.NVarChar };
            SqlParameter pPatronymic = new SqlParameter() { ParameterName = "patronymic", SqlValue = Patronymic, SqlDbType = SqlDbType.NVarChar };
            SqlParameter pDisplayName = new SqlParameter() { ParameterName = "display_name", SqlValue = DisplayName, SqlDbType = SqlDbType.NVarChar };
            SqlParameter pMale = new SqlParameter() { ParameterName = "male", SqlValue = Male, SqlDbType = SqlDbType.NVarChar };
            SqlParameter pIdCameResource = new SqlParameter() { ParameterName = "id_came_resource", SqlValue = IdCameResource, SqlDbType = SqlDbType.Int };
            SqlParameter pBirthDate = new SqlParameter() { ParameterName = "birth_date", SqlValue = BirthDate, SqlDbType = SqlDbType.DateTime };
            SqlParameter pCreatorAdSid = new SqlParameter() { ParameterName = "creator_sid", SqlValue = creatorSid, SqlDbType = SqlDbType.VarChar };
            SqlParameter pPhone = new SqlParameter() { ParameterName = "phone", SqlValue = Phone, SqlDbType = SqlDbType.NVarChar };
            SqlParameter pEmail = new SqlParameter() { ParameterName = "email", SqlValue = Email, SqlDbType = SqlDbType.NVarChar };

            var dt = Db.Stuff.ExecuteQueryStoredProcedure("recruit_candidate_create", pSurname, pName, pPatronymic, pDisplayName, pMale, pIdCameResource, pBirthDate, pCreatorAdSid, pPhone, pEmail);
            int id = 0;
            if (dt.Rows.Count > 0)
            {
                int.TryParse(dt.Rows[0]["id"].ToString(), out id);
                Id = id;
            }
        }

        public static IEnumerable<RecruitCandidate> GetList(out int totalCount, int? topRows = null, int? pageNum = null)
        {
            if (!topRows.HasValue) topRows = 30;
            if (!pageNum.HasValue) pageNum = 1;

            SqlParameter ptopRows = new SqlParameter() { ParameterName = "top_rows", SqlValue = topRows, SqlDbType = SqlDbType.Int };
            SqlParameter ppageNum = new SqlParameter() { ParameterName = "page_num", SqlValue = pageNum, SqlDbType = SqlDbType.Int };
            var dt = Db.Stuff.ExecuteQueryStoredProcedure("recruit_candidate_get_list", ptopRows, ppageNum);

            totalCount = 0;
            var lst = new List<RecruitCandidate>();

            if (dt.Rows.Count > 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    var model = new RecruitCandidate(row);
                    lst.Add(model);
                }
                totalCount = Db.DbHelper.GetValueIntOrDefault(dt.Rows[0], "total_count");
            }
            return lst;
        }

        public static void Close(int id, string deleterSid)
        {
            SqlParameter pId = new SqlParameter() { ParameterName = "id", SqlValue = id, SqlDbType = SqlDbType.Int };
            SqlParameter pDeleterSid = new SqlParameter() { ParameterName = "deleter_sid", SqlValue = deleterSid, SqlDbType = SqlDbType.VarChar };
            var dt = Db.Stuff.ExecuteQueryStoredProcedure("recruit_candidate_close", pId, pDeleterSid);
        }
    }
}