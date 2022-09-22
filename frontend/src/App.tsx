import React, { useState } from 'react';
import "primeicons/primeicons.css";
import './App.css';
import { BrowserRouter, Routes, Route, Navigate } from 'react-router-dom';
import AdminHeader from './components/modules/pagecomponents/Admin/AdminHeader/AdminHeader';
import AdminLanding from './components/pages/Admin/LandingPage';
import Header from './components/modules/pagecomponents/Header/Header';
function App() {
  const [user, setUser] = useState(0);
  return (
    <div id="App">
      <BrowserRouter>
        {(() => {
          switch (user) {
            case 0:
              return <Header />;
            case 1:
              return <AdminHeader />;
          }
        })()}

        <Routes>
          <Route path='/admin' element={<AdminLanding />}></Route>
        </Routes>
      </BrowserRouter>

    </div>
  );
}

export default App;
