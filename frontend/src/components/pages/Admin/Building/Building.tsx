import './Building.css';
import { useEffect, useState } from 'react';
import { Building, User } from '../../../../model';
import { useSelector } from 'react-redux';
import MessageBox from '../../../modules/pagecomponents/popups/MessageBox/MessageBox';

const BuildingManage = () => {
    const user = useSelector((state: any) => state.auth.login.currentUser.data);
    const [buildings, setBuildings] = useState<Building[]>([]);
    const [block, setBlock] = useState<string>();
    const [room, setRoom] = useState<string>();
    const [message, setMessage] = useState('');
    const [messageStatus, setMessageStatus] = useState('');
    const [status, setStatus] = useState<string>('Add Building');

    useEffect(() => {
        fetchData();
    }, [message])

    async function fetchData() {
        try {
            const res = await fetch("http://nguyenxuanthuan-001-site1.htempurl.com/api/buildings", {
                headers: {
                    Authorization: `Bearer ${user?.jwtToken}`,
                    'Content-Type': 'application/json'
                }
            });
            const data = await res.json();
            setBuildings(data.data);
        } catch (err) {
        }
    }

    async function handleEdit(id: string) {
        try {
            const response = await fetch(`http://nguyenxuanthuan-001-site1.htempurl.com/api/buildings/${id}`, {
                method: 'PUT',
                headers: {
                    Authorization: `Bearer ${user?.jwtToken}`,
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    id: id,
                    name: block,
                    address: room
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
            const response = await fetch("http://nguyenxuanthuan-001-site1.htempurl.com/api/buildings", {
                method: 'POST',
                headers: {
                    Authorization: `Bearer ${user?.jwtToken}`,
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    name: block,
                    address: room
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
            case "Add Building":
                setStatus("Edit Building");
                break;
            case "Edit Building":
                setStatus("Add Building");
                break;
        }
    }
    const render = () => {
        switch (status) {
            case "Add Building":
                return (
                    <div className="container">
                        <ul className="user-wrap">
                            {
                                buildings?.map((item, index) => {
                                    return (
                                        <li key={index} className="item">
                                            <div className="item-cover">
                                                <span className="item-name">{item.name}</span>
                                                <span className="item-room">Room: <strong>{item.address}</strong>
                                                </span>
                                                <div className="item-edit">
                                                    <span>Block: <input type="text" className="input" onChange={(e) => { setBlock(e.target.value) }} /></span>
                                                    <span>Room: <input type="text" className="input" onChange={(e) => { setRoom(e.target.value) }} /></span>
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
                                        <span>Block: <input type="text" className="input" onChange={(e) => { setBlock(e.target.value) }} /></span>
                                        <span>Room: <input type="text" className="input" onChange={(e) => { setRoom(e.target.value) }} /></span>
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
        <div id="Building">
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

export default BuildingManage;