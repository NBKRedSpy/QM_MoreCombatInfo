using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MoreCombatInfo
{
    public class HistoricalInfo<T> 
    {
        public T Previous { get; set; }
        public T Current { get; set; }

        /// <summary>
        /// Returns true if the current and previous values are different.
        /// </summary>
        /// <returns></returns>
        public bool HasChanged => !EqualityComparer<T>.Default.Equals(Current, Previous);

        /// <summary>
        /// Clears the data and resets the values to the default values.
        /// </summary>
        public void Clear()
        {
            Previous = default(T);
            Current = default(T);   
        }

        //public void SetCurrent(T value)
        //{
        //    //Current = value;
        //    //bool changed = EqualityComparer<T>.Default.Equals(Current, value);
        //    //Current = value;

        //    //return changed;
        //}
    }
}
