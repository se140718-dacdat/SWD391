import './CategoryManage.css';
import { useEffect, useState } from 'react';
import { Building, Category, User } from '../../../../model';
import { useSelector } from 'react-redux';
import MessageBox from '../../../modules/pagecomponents/popups/MessageBox/MessageBox';

const CategoryManage = () => {
    const user = useSelector((state: any) => state.auth.login.currentUser.data);
    const [categories, setCategories] = useState<Category[]>([]);
    const [icon, setIcon] = useState<string>();
    const [name, setName] = useState<string>();
    const [message, setMessage] = useState('');
    const [messageStatus, setMessageStatus] = useState('');
    const [status, setStatus] = useState<string>('Add Category');

    useEffect(() => {
        fetchData();
    }, [message])

    async function fetchData() {
        try {
            const res = await fetch("http://nguyenxuanthuan-001-site1.htempurl.com/api/categories", {
                headers: {
                    Authorization: `Bearer ${user?.jwtToken}`,
                    'Content-Type': 'application/json'
                }
            });
            const data = await res.json();
            setCategories(data.data);
        } catch (err) {
        }
    }

    async function handleEdit(id: string) {
        try {
            const response = await fetch(`http://nguyenxuanthuan-001-site1.htempurl.com/api/categories/${id}`, {
                method: 'PUT',
                headers: {
                    Authorization: `Bearer ${user?.jwtToken}`,
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    id: id,
                    name: name,
                    icon: icon
                })
            });
            setMessage("Edited!")
            setMessageStatus("green");
        } catch (error) {
            setMessageStatus("red");
            setMessage("Edit fail!");
        }
    }

    async function handleAdd() {
        try {
            const response = await fetch("http://nguyenxuanthuan-001-site1.htempurl.com/api/categories", {
                method: 'POST',
                headers: {
                    Authorization: `Bearer ${user?.jwtToken}`,
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    name: name,
                    address: icon
                })
            });
            setMessage("Added!!")
            setMessageStatus("green");
            setStatus("Add Building");
        } catch (error) {
            setMessageStatus("red");
            setMessage("Add fail!");
        }
    }

    const handleStatus = () => {
        switch (status) {
            case "Add Category":
                setStatus("Edit Category");
                break;
            case "Edit Category":
                setStatus("Add Category");
                break;
        }
    }
    const render = () => {
        switch (status) {
            case "Add Category":
                return (
                    <div className="container">
                        <ul className="user-wrap">
                            {
                                categories?.map((item, index) => {
                                    return (
                                        <li key={index} className="item">
                                            <div className="item-cover">
                                            <img className= "menu-item-icon" src={item.icon}></img>
                                                <span className="item-name"><strong>{item.name}</strong>
                                                </span>
                                                <div className="item-edit">
                                                    <span>Icon: <input type="text" className="input" onChange={(e) => { setIcon(e.target.value) }} /></span>
                                                    <span>Name: <input type="text" className="input" onChange={(e) => { setName(e.target.value) }} /></span>
                                                    <button className="btn-edit btn-primary-color" onClick={() => { handleEdit(item.id) }} >Edit</button>
                                                </div>
                                            </div>
                                        </li>
                                    );
                                })
                            }
                        </ul>
                    </div>
                )
            case "Edit Building":
                return (
                    <div className="container">
                        <ul className="user-wrap">
                            <li className="item">
                                <div className="item-cover">
                                    <div className="item-edit">
                                        <span>Icon: <input type="text" className="input" onChange={(e) => { setIcon(e.target.value) }} /></span>
                                        <span>Name: <input type="text" className="input" onChange={(e) => { setName(e.target.value) }} /></span>
                                        <button className="btn-edit btn-primary-color" onClick={() => { handleAdd() }} >Add</button>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                )
        }
    }


    return (
        <div id="CategoryManage">
            {
                message != '' ?
                    <MessageBox status={messageStatus} message={message} setMessage={setMessage} title='inasd'></MessageBox>
                    :
                    null
            }
            <h1>Manage</h1>
            <button className='btn-status btn-primary-color' onClick={() => { handleStatus() }}>{status}</button>
            {render()}
        </div>
    )
}

export default CategoryManage;