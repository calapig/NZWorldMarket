using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NZWorldMarket.DAL
{
    public class CartItemDAL
    {
        public long advertItemID { get; set; }
        public DateTime initRequestDate { get; set; }
        public DateTime finalRequestDate { get; set; }
        public int quantity { get; set; }
        public decimal price { get; set; }

        public AdvertItemDAL item { get; set; }

        public CartItemDAL()
        { }

        public CartItemDAL(AdvertItemDAL item, int quantity)
        {
            this.item = item;
            this.quantity = quantity;
            this.price = item.price;
        }

        internal void AddQuantity()
        {
            quantity++;
        }

        internal void SetQuantity(int newQuantity)
        {
            this.quantity = newQuantity;
        }

        public string Display()
        {
            string displayString = string.Format("{0} ({1} at {2} each)", item.name,
            quantity.ToString(),
            item.price.ToString("c")); return displayString;
        }

    }
}