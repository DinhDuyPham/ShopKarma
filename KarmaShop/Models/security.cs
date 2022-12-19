using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;

using System.Security.Cryptography;
namespace KarmaShop.Models
{
    public class security

    { /// <summary>
    /// hàm dùng mã hóa một chuỗi văn bản gốc dựa vào việc băm dữ liệu SHA256
    /// </summary>
    /// <param name="PlainText"></param>
    /// <returns></returns>
        public static string encrytSHA256(string PlainText) {
            string result = "";
            //----creat a SHA256 object------------
            using(SHA256 bb= SHA256.Create())
            {
                //--- convern plain text  to a bytes array----
                byte[] sourceData = Encoding.UTF8.GetBytes(PlainText);
                //---Compute Hash and return  a byte array----
                byte[] hashResult = bb.ComputeHash(sourceData);
                result = BitConverter.ToString(hashResult).Replace("-","");
            }
            return result;
        
        }
    }
}