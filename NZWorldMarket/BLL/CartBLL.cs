using NZWorldMarket.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NZWorldMarket.BLL
{
    public class CartBLL
    {
        List<CartItemDAL> cart;

        public CartBLL() {
            cart = new List<CartItemDAL>();
        }

        public int Count { get { return cart.Count; } }
        
        public CartItemDAL this[int index] {
            get { return cart[index]; }
        }

        public CartItemDAL this[long id]
        {
            get
            {
                foreach (CartItemDAL it in cart)
                    if (it.advertItemID == id) return it;
                return null;
            }
        }

        public static CartBLL GetCart()
        {
            CartBLL cart = (CartBLL)HttpContext.Current.Session["Cart"];
            if (cart == null)
                HttpContext.Current.Session["Cart"] = new CartBLL();

            return (CartBLL)HttpContext.Current.Session["Cart"];
        }

        public void AddItem(CartItemDAL item)
        {
            cart.Add(item);
        }

        public void RemoveItemAt(int index)
        {
            cart.RemoveAt(index);
        }

        public void Clear()
        {
            cart.Clear();
        }

    }
}