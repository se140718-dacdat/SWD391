
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
                            <td className="product-remove"><div className="btn-remove">×</div></td>
                            <td className="product-font product-image"><img style={{width: "100px", height: "100px", borderRadius: "6px"}} src="https://cdn.shopify.com/s/files/1/0814/0539/products/p191213_Barrel_46_Whiskey_Espresso_1123_1080px_600x.jpg?v=1666056574" alt="" /></td>
                            <td className="product-font product-name fw-500"><strong>rosewood watch</strong></td>
                            <td className="product-font product-price">$130.00</td>
                            <td className="product-font product-quantity">1</td>
                            <td className="product-font product-subtotal">$130.00</td>
                        </tr>
                        <tr>
                            <td className="product-remove"><div className="btn-remove">×</div></td>
                            <td className="product-font product-image"><img style={{width: "100px", height: "100px", borderRadius: "6px"}} src="https://cdn.shopify.com/s/files/1/0814/0539/products/p191213_Barrel_46_Whiskey_Espresso_1123_1080px_600x.jpg?v=1666056574" alt="" /></td>
                            <td className="product-font product-name fw-500"><strong>rosewood watch</strong></td>
                            <td className="product-font product-price">$130.00</td>
                            <td className="product-font product-quantity">1</td>
                            <td className="product-font product-subtotal">$130.00</td>
                        </tr>
                        <tr>
                            <td className="product-remove"><div className="btn-remove">×</div></td>
                            <td className="product-font product-image"><img style={{width: "100px", height: "100px", borderRadius: "6px"}} src="https://cdn.shopify.com/s/files/1/0814/0539/products/p191213_Barrel_46_Whiskey_Espresso_1123_1080px_600x.jpg?v=1666056574" alt="" /></td>
                            <td className="product-font product-name fw-500"><strong>rosewood watch</strong></td>
                            <td className="product-font product-price">$130.00</td>
                            <td className="product-font product-quantity">1</td>
                            <td className="product-font product-subtotal">$130.00</td>
                        </tr>
                    </tbody>
                </table>
                <div className="cart-total">
                    <table style={{float: "right", width: "50%"}}>
                        <tbody>
                            <tr className="subtotal">
                                <th>subtotal</th>
                                <td>$1,725.00</td>
                            </tr>
                            <tr className="total">
                                <th>total</th>
                                <td>$1,725.00</td>
                            </tr>
                        </tbody>
                    </table>
                    <div className="process-checkout">
                        <button className="btn-checkout btn-primary-color">Proceed to checkout</button>
                    </div>
                </div>
            </div>
        </div>
    );
}

export default Cart;