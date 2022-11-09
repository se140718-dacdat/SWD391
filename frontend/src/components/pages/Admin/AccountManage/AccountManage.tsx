import './AccountManage.css';
import { useEffect, useState } from 'react';
import { User } from '../../../../model';
import { useSelector } from 'react-redux';
import MessageBox from '../../../modules/pagecomponents/popups/MessageBox/MessageBox';

const AccountManage = () => {
    const user = useSelector((state: any) => state.auth.login.currentUser.data);
    const [users, setUsers] = useState<User[]>([]);
    const [wallet, setWallet] = useState(0);
    const [message, setMessage] = useState('');
    const [messageStatus, setMessageStatus] = useState('');

    useEffect(() => {
        fetchData();
    }, [message])

    async function fetchData() {
        try {
            const res = await fetch("http://nguyenxuanthuan-001-site1.htempurl.com/api/accounts", {
                headers: {
                    Authorization: `Bearer ${user?.jwtToken}`,
                    'Content-Type': 'application/json'
                }
            });
            const data = await res.json();
            setUsers(data.data);
            console.log(users)
        } catch (err) {
        }
    }

    async function handleWallet(id: string) {
        try {
            const response = await fetch(`http://nguyenxuanthuan-001-site1.htempurl.com/api/accounts/balance/${id}?money=${wallet}`, {
                method: 'POST',
                headers: {
                    Authorization: `Bearer ${user?.jwtToken}`,
                    'Content-Type': 'application/json'
                }
            });
            setWallet(0);
            setMessage("Add Successful!");
            setMessageStatus("green");
        } catch (error) {
            setMessage("Add fail!");
            setMessageStatus("red");
        }
    }

    async function handleRemove(id: string) {
        try {
            const response = await fetch(`http://nguyenxuanthuan-001-site1.htempurl.com/api/accounts/${id}`, {
                method: 'DELETE',
                headers: {
                    Authorization: `Bearer ${user?.jwtToken}`,
                    'Content-Type': 'application/json'
                },
            });
            setMessage("Removed!");
            setMessageStatus("green");
        } catch (error) {
            setMessage("Remove fail!");
            setMessageStatus("red");
        }
    }
    return (
        <div id="AccountManage">
            {
                message != '' ?
                    <MessageBox status={messageStatus} message={message} setMessage={setMessage} title='inasd'></MessageBox>
                    :
                    null
            }
            <h1>Manage</h1>
            <div className="container">
                <ul className="user-wrap">
                    {
                        users?.map((item, index) => {
                            return (
                                <li key={index} className="item clearfix">
                                    <div className="item-img">
                                        <img src={item.avatarUrl} alt="" />
                                    </div>
                                    <div className="item-cover">
                                        <h2 className="item-name">{item.fullName}</h2>
                                        <span>Phone: <strong>{item.phone}</strong>
                                        </span>
                                        <span>Gender: <strong>{item.gender}</strong>
                                        </span>
                                        <span> Description: <strong>{item.description}</strong>
                                        </span>
                                        <span style={{ marginTop: '12px' }}>Add Wallet:
                                            <input type="text" className='wallet-input' onChange={(e) => { setWallet(parseInt(e.target.value)) }} />
                                            <button className='btn-add-wallet btn-primary-color' onClick={() => { handleWallet(item.id) }}>Add</button>
                                        </span>
                                    </div>
                                    <div className="product-remove">
                                        <div className="btn-remove" onClick={() => { handleRemove(item.id) }}>×</div>
                                    </div>
                                </li>
                            );
                        })
                    }
                </ul>
            </div>
        </div>
    )
}

export default AccountManage;