/*using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public class Newsletter
{
        //public Newsletter();
        #region Declarations
        public string FName{get;set;}
        public string LName { get; set; }
        public string Email { get; set; }
        public bool Subscribe { get; set; }
        public string ErrorMsg { get; set; }
        #endregion

        #region Methods
        public void InsertSubscription()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["mwd"].ConnectionString);
            SqlCommand cmd = new SqlCommand("INSERT INTO EmailRecipients(FName,LName,Email,Subscribe)VALUES(@FName,@LName,@Email,@Subscribe)", conn);
            SqlParameter parameterFName = new SqlParameter("@FName", SqlDbType.VarChar, 50);
            parameterFName.Value = FName;
            cmd.Parameters.Add(parameterFName);
            SqlParameter parameterLName = new SqlParameter("@LName", SqlDbType.VarChar, 50);
            parameterLName.Value = LName;
            cmd.Parameters.Add(parameterLName);
            SqlParameter parameterEmail = new SqlParameter("@Email", SqlDbType.VarChar, 50);
            parameterEmail.Value = Email;
            cmd.Parameters.Add(parameterEmail);
            SqlParameter parameterSubscribe = new SqlParameter("@Subscribe", SqlDbType.Bit);
            parameterSubscribe.Value = 45;
            cmd.Parameters.Add(parameterSubscribe);
            try
            {
                conn.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            finally
            {
                cmd.Dispose();
                conn.Close();
            }
        }
        public void UpdateSubscribers()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["mwd"].ConnectionString);
            SqlCommand cmd = new SqlCommand("UPDATE EmailRecipients SET Subscribe=@Subscribe WHERE Email=@Email", conn);
            SqlParameter parameterEmail = new SqlParameter("@Email", SqlDbType.VarChar, 50);
            parameterEmail.Value = Email;
            cmd.Parameters.Add(parameterEmail);
            SqlParameter parameterSubscribe = new SqlParameter("@Subscribe", SqlDbType.Bit);
            parameterSubscribe.Value = Subscribe;
            cmd.Parameters.Add(parameterSubscribe);
            try
            {
                conn.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            finally
            {
                cmd.Dispose();
                conn.Close();
            }
        }
        #endregion
}
*/
