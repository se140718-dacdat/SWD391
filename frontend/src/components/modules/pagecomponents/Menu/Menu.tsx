import React, { Dispatch, SetStateAction } from 'react'
import "./Menu.css";
// interface Props {
//     setUser: Dispatch<SetStateAction<User | null>>;
// }
const Menu: React.FC = props => {
    const menuList = [{
        name: "car"
    },
    {
        name: "houseware"
    }, {
        name: "Car"
    }, {
        name: "Car"
    }, {
        name: "Car"
    }, {
        name: "Car"
    }, {
        name: "Car"
    }, {
        name: "Car"
    }, {
        name: "Car"
    }, {
        name: "Car"
    },
    ];

    return (
        <div id="Menu">
            <div className="menu-container">
                <p className="menu-title">Categories</p>
                <ul className="menu-list">
                    {
                        menuList.map((item, index) => {
                            return (
                                <li className="menu-item">
                                    <a href={`/${item.name}`} className="menu-item-link">
                                        {/* <i className={`menu-item-icon ${item.icon}`}></i> */}
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