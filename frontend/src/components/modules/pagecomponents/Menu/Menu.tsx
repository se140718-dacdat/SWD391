import React, { Dispatch, SetStateAction, useEffect, useState } from 'react'
import { useSelector, useDispatch } from 'react-redux';
import { useNavigate } from 'react-router-dom';
import { Category } from '../../../../model';
import { getCategoryById } from '../../../../redux/apiRequest';
import "./Menu.css";
const Menu: React.FC = props => {
    const [categories, setCategories] = useState<Category[]>([]);
    useEffect(() => {
        fetchData();
    }, []);

    async function fetchData() {
        const response = await fetch("https://localhost:5001/api/categories");
        const data = await response.json();
        setCategories(data.data.sort());
    }

    return (
        <div id="Menu" className='left-side'>
            <div className="menu-container">
                <p className="menu-title">Danh mục</p>
                <ul className="menu-list">
                    <li className="menu-item clear-fix">
                        <a href="/" className="menu-item-link">
                            <img className= "menu-item-icon" src="https://pic.onlinewebfonts.com/svg/img_123607.png"></img>
                            <span className="menu-item-name">All Categories</span>
                        </a>
                    </li>
                    {
                        categories?.map((item, index) => {
                            return (
                                <li key={index} className="menu-item clear-fix">
                                    <a href={`/${item.id}`} className="menu-item-link">
                                        <img className= "menu-item-icon" src={item.icon}></img>
                                        <span className="menu-item-name">{item.name}</span>
                                    </a>
                                </li>
                            )
                        })
                    }
                </ul>
            </div>
        </div>
    );
}

export default Menu;