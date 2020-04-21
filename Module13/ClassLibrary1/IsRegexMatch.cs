using System;
using System.Collections.Generic;
using System.Data.SqlTypes;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace ClassLibrary1
{
    public class IsRegexMatch
    {
        [Microsoft.SqlServer.Server.SqlFunction]
        public static SqlBoolean IsRegex(SqlString input, SqlString pattern)
        {
            SqlBoolean retval = SqlBoolean.Null;

            if (!input.IsNull && !pattern.IsNull)
            {
                bool result = Regex.IsMatch(input.Value, pattern.Value);
                retval = result ? new SqlBoolean(true) : new SqlBoolean(false);
            }

            return retval;
        }
    }
}
