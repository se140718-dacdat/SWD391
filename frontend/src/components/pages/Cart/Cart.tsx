import { Form } from "react-bootstrap";
import { useDispatch, useSelector } from "react-redux";
import { currencyMaskString } from "../../../mask";
import { cartItem, checkoutForm, getProducts, getTotal, PostShow } from "../../../model";
import { checkoutRequest, clearCart } from "../../../redux/apiRequest";
import "./Cart.css";
import { useState } from "react";

const Cart = () => {
    const cart = useSelector((state: any) => state.cart.cart.currentCart);
    const user = useSelector((state: any) => state.auth.login.currentUser.data);
    const [transactionType, setTransactionType] = useState<string>('');
    const [message, setMessage] = useState<string>();
    const dispatch = useDispatch();

    const handleCheckout = () => {

        let checkout: checkoutForm = {
            accountId: user?.id,
            walletId: user?.id,
            description: "Some desciption",
            transactionType: transactionType,
            cartList: getProducts(cart)
        };
        let check = true;
        console.log(checkoutRequest(checkout, user, dispatch))
        if (check) {
            clearCart(dispatch);
        } else {
            setMessage('Checkout fail! Please try again.')
        }
    }

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
                        {
                            cart?.map((item: cartItem, index: number) => {
                                return (
                                    <tr key={index}>
                                        <td className="product-remove"><div className="btn-remove">×</div></td>
                                        <td className="product-font product-image"><img style={{ width: "100px", height: "100px", borderRadius: "6px" }} src={item.post.imageUrl} alt="" /></td>
                                        <td className="product-font product-name fw-500"><strong>{item.post.product.name}</strong></td>
                                        <td className="product-font product-price">{`$${currencyMaskString(item.post.price)}`}</td>
                                        <td className="product-font product-quantity">{item.quantity}</td>
                                        <td className="product-font product-subtotal">{`$${currencyMaskString(item.quantity * item.post.price)}`}</td>
                                    </tr>
                                )
                            })
                        }
                    </tbody>
                </table>
                <div className="cart-total">
                    <table style={{ float: "right", width: "50%" }}>
                        <tbody>
                            <tr className="total">
                                <th>checkout by</th>
                                <td>
                                    <Form.Select aria-label="Default select example" onChange={(e) => {
                                        setTransactionType(e.target.value);
                                        console.log(transactionType)
                                    }}>
                                        <option value="COD">COD</option>
                                        <option value="VI">VI</option>
                                        <option value="Banking">Banking</option>
                                    </Form.Select>
                                </td>
                            </tr>
                            <tr className="total">
                                <th>total</th>
                                <td>{`$${currencyMaskString(getTotal(cart))}`}</td>
                            </tr>
                        </tbody>
                    </table>

                    <div className="process-checkout">
                        <button className="btn-clear-cart" onClick={() => {
                            clearCart(dispatch);
                        }}>Clear cart</button>
                        <button className="btn-checkout btn-primary-color" onClick={() => {
                            handleCheckout();
                        }}>Proceed to checkout</button>
                    </div>
                </div>
            </div>
        </div>
    );
}

export default Cart;