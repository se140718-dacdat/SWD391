import "./CreatePost.css";
import React, { useState } from 'react';

const CreatePost: React.FC = props => { 
    const [input, setInput] = useState("generate");
    const renderSwitch = () => {
        switch(input) {
            case "generate":
                return (
                    <div className="post-input">
                        <div className="input inline-block">
                            <div className="input-title">Post name</div>
                            <input type="text" className="input-value" />
                        </div>
                        <div className="input inline-block">
                            <div className="input-title">Regular price ($)</div>
                            <input type="text" className="input-value" />
                        </div>
                        <div className="input inline-block">
                            <div className="input-title">Dimensions</div>
                            <input type="text" className="input-value" />
                        </div>
                        <div className="input inline-block">
                            <div className="input-title">Image</div>
                            <div className="input-value">
                                <input type="text" className="input-img" />
                                <button  className="btn-add-img">Add Media</button>
                            </div>
                        </div>
                    </div>
                );
            case "inventory":
                return(
                    <div className="post-input">
                    <div className="input inline-block">
                           <div className="input-title">SKU</div>
                           <input type="text" className="input-value" />
                       </div>
                       <div className="input inline-block">
                           <div className="input-title">Stock quantity</div>
                           <input type="text" className="input-value" />
                       </div>
               </div>
                );
            case "description":
                return(
                    <div className="post-input">
                    <div className="input inline-block">
                           <div className="input-title">Short description</div>
                           <input type="text" className="input-value" />
                       </div>
                       <div className="input inline-block">
                           <div className="input-title">Description</div>
                           <input type="text" className="input-value" />
                       </div>
               </div>
                );
        }
    }
    return(
        <div id="CreatePost"  className="right-side">
            <h1>Add new post</h1>
            <div className="border">
                <div className="product-type">
                    <div className="product-img">
                        <img src="" alt="" />
                    </div>
                    <div className="product-summary">
                        <h1 className="product-name"></h1>
                        <div className="product-price"></div>
                        <div className="product-description"></div>
                        {/* <button className="btn-addtocart"></button> */}
                        {/* <h4>SPECS</h4>
                        <div className="product-information">
                            <span className="dimensions-wrapper">
                                <span className="product-att-title">Dimensions:</span>
                                <span className="product-att">16 × 9 × 13 in</span>
                            </span>
                            <span className="sku-wrapper">
                                <span className="product-att-title">SKU:</span>
                                <span className="product-att">HDGHR275JGD</span>
                            </span>
                            <span className="category-wrapper">
                                <span className="product-att-title">Category:</span>
                                <span className="product-att">Uncategoried</span>
                            </span>
                            <span className="tag-wrapper">
                                <span className="product-att-title">Tag:</span>
                                <span className="product-att">Swimming wear</span>
                            </span>
                            <span className="availability-wrapper">
                                <span className="product-att-title">Availability:</span>
                                <span className="product-att">120 in stock</span>
                            </span>
                        </div> */}
                    </div>
                </div>
            </div>
            <div className="border">
                <div className="p-32">
                {/* <h3>Description</h3> */}
                <div className="description"></div>
                </div>
            </div>
            <div className="post-data">
                <ul className="options">
                    <li className="option" onClick={()=>{setInput('generate')}}>General</li>
                    <li className="option" onClick={()=>{setInput('inventory')}}>Inventory</li>
                    <li className="option" onClick={()=>{setInput('description')}}>Description</li>
                </ul>
                    {renderSwitch()}

            </div>
            <div className="w-30"></div>
        </div>
    );
}
export default CreatePost;