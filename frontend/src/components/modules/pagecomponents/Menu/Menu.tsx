import React, { Dispatch, SetStateAction, useState } from 'react'
import "./Menu.css";
// interface Props {
//     setUser: Dispatch<SetStateAction<User | null>>;
// }
const Menu: React.FC = props => {
    const [checked, isChecked] = useState();

    const menuList = [{
        name: "Lướt xem tất cả"
    },
    {
        name: "Xe cộ"
    }, {
        name: "Bán nhà"
    }, {
        name: "Đồ gia dụng"
    }, {
        name: "Đồ may mặc"
    }, {
        name: "Đồ điện tử"
    }, {
        name: "Rao vặt"
    }
    ];

    return (
        <div id="Menu" className='left-side'>
            <div className="menu-container">
                <p className="menu-title">Danh mục</p>
                <ul className="menu-list">
                    {
                        menuList.map((item, index) => {
                            return (
                                <li className="menu-item">
                                    <a href="/" className="menu-item-link">
                                        {/* <i className={`menu-item-icon ${item.icon}`}></i> */}
                                        <span className="menu-item-name">{item.name}</span>
                                    </a>
                                </li>
                            )
                        })
                    }
                </ul>
                <p className="menu-title">Bài viết</p>
                <ul className="menu-list">
                    <li className="menu-item">
                        <a href="/create-post" className="menu-item-link">
                                        {/* <i className={`menu-item-icon ${item.icon}`}></i> */}
                            <span className="menu-item-name">Đăng bài</span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    );
}

export default Menu;