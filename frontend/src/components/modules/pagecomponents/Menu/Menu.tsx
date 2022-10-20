import React, { Dispatch, SetStateAction, useState } from 'react'
import "./Menu.css";
// interface Props {
//     setUser: Dispatch<SetStateAction<User | null>>;
// }
const Menu: React.FC = props => {
    const [checked, isChecked] = useState();

    const menuList = [
    {
        name: "Bất động sản",
        icon: "https://static.chotot.com/storage/categories/all-category-v3/1000.png"
    }, {
        name: "Xe cộ",
        icon: "https://static.chotot.com/storage/categories/all-category-v3/2000.png"
    }, {
        name: "Đồ điện tử",
        icon: "https://static.chotot.com/storage/categories/all-category-v3/5000.png"
    }, {
        name: "Việc làm",
        icon: "https://static.chotot.com/storage/categories/all-category-v3/13000.png"
    }, {
        name: "Thú cưng",
        icon: "https://static.chotot.com/storage/categories/all-category-v3/12000.png"
    }, {
        name: "Đồ ăn, thực phẩm và các loại khác",
        icon: "https://static.chotot.com/storage/categories/all-category-v3/7000.png"
    }
    , {
        name: "Tủ lạnh, máy lạnh, máy giặt",
        icon: "https://static.chotot.com/storage/categories/all-category-v3/9000.png"
    }
    , {
        name: "Đồ gia dụng, nội thất, cây cảnh",
        icon: "https://static.chotot.com/storage/categories/all-category-v3/14000.png"
    }
    , {
        name: "Mẹ và bé",
        icon: "https://static.chotot.com/storage/categories/all-category-v3/11000.png"
    }
    , {
        name: "Thời trang",
        icon: "https://static.chotot.com/storage/categories/all-category-v3/3000.png"
    }
    , {
        name: "Đồ dùng cá nhân",
        icon: "https://static.chotot.com/storage/categories/all-category-v3/4000.png"
    }
    , {
        name: "Giải trí, Thể thao, Sở thích",
        icon: "https://static.chotot.com/storage/categories/all-category-v3/8000.png"
    }
    , {
        name: "Đồ dùng văn phòng, công nông nghiệp",
        icon: "https://static.chotot.com/storage/categories/all-category-v3/6000.png"
    }
    , {
        name: "Dịch vụ, Du lịch",
        icon: "https://static.chotot.com/storage/categories/all-category-v3/2000.png"
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
                                <li className="menu-item clear-fix">
                                    <a href="/" className="menu-item-link">
                                        <img className= "menu-item-icon" src={item.icon}></img>
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