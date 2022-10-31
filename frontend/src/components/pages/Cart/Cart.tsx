
import "./Cart.css";

const Cart = () => {
    return (
        <div id="Cart" className="right-side">
            <h1 style={{ fontSize: "2rem", fontWeight: "700" }}>Cart</h1>
            <div className="cart-wrapper">
                <table>
                    <thead>
                        <tr>
                            <th className="product-remove"></th>
                            <th className="product-image"></th>
                            <th className="product-name">product</th>
                            <th className="product-price">price</th>
                            <th className="product-quantity">quantity</th>
                            <th className="product-subtotal">subtotal</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th className="product-remove"><div className="btn-remove">×</div></th>
                            <th className="product-image"><img style={{width: "100px", height: "100px", borderRadius: "6px"}} src="https://cdn.shopify.com/s/files/1/0814/0539/products/p191213_Barrel_46_Whiskey_Espresso_1123_1080px_600x.jpg?v=1666056574" alt="" /></th>
                            <th className="product-name">rosewood watch</th>
                            <th className="product-price">$130.00</th>
                            <th className="product-quantity">1</th>
                            <th className="product-subtotal">$130.00</th>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    );
}

export default Cart;