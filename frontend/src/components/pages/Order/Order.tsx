import './Order.css';
import { useEffect, useState } from 'react';
import { useSelector } from 'react-redux';
import { OrderDetail } from '../../../model';
import { currencyMaskString } from '../../../mask';

const Order = () => {
    const user = useSelector((state: any) => state.auth.login.currentUser.data);
    const [orders, setOrders] = useState<OrderDetail[]>([]);
    useEffect(() => {
        fetchData();
    }, [])

    async function fetchData() {
        const res = await fetch(`http://nguyenxuanthuan-001-site1.htempurl.com/api/orders/users?id=${user.id}`, {
            headers: {
                Authorization: `Bearer ${user?.jwtToken}`,
                'Content-Type': 'application/json'
            },
        });
        const data = await res.json();
        setOrders(data.data);
        console.log(orders);
    }
    return (
        <div id="Order" className="right-side">
            <ul className="products">
                {
                    orders?.map((item, index) => {
                        return (
                            <li key={index} className="item clearfix">
                                <div className="item-img">
                                    <img src={item.post.imageUrl} alt="" />
                                </div>
                                <div className="item-cover">
                                    <h2 className="item-title">{item.post.title}</h2>
                                    <span className="item-quantity">x{item.quantity}</span>
                                    <span className="item-price border-bottom">{currencyMaskString(item.post.price)}</span>
                                    <div className="item-bottom">
                                        <span className="item-date">{item.transaction.transactionTime}</span>
                                        <span className="item-total">{currencyMaskString(item.total)}$</span>
                                    </div>
                                </div>
                            </li>
                        )
                    })
                }
            </ul>
        </div>
    )
}

export default Order;