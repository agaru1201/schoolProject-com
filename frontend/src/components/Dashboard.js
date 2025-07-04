import React from 'react';
import { useAuth } from '../context/AuthContext';
import { useNavigate } from 'react-router-dom';
import './Dashboard.css';

const Dashboard = () => {
  const { currentUser, logout } = useAuth();
  const navigate = useNavigate();

  const handleLogout = () => {
    logout();
    navigate('/login');
  };

  return (
    <div className="dashboard-container">
      <div className="dashboard-header">
        <h1>Welcome to Your Dashboard</h1>
        <button onClick={handleLogout} className="logout-button">
          Logout
        </button>
      </div>

      <div className="dashboard-content">
        <div className="profile-card">
          <h2>Profile Information</h2>
          <div className="profile-info">
            <div className="info-item">
              <label>User ID:</label>
              <span>{currentUser?.id}</span>
            </div>
            <div className="info-item">
              <label>Username:</label>
              <span>{currentUser?.username}</span>
            </div>
            <div className="info-item">
              <label>Email:</label>
              <span>{currentUser?.email}</span>
            </div>
          </div>
        </div>

        <div className="welcome-card">
          <h2>🎉 Welcome, {currentUser?.username}!</h2>
          <p>You have successfully logged into your account.</p>
          <p>This is a protected route that requires authentication.</p>
          
          <div className="dashboard-features">
            <h3>Available Features:</h3>
            <ul>
              <li>✅ Secure Authentication</li>
              <li>✅ JWT Token Management</li>
              <li>✅ MySQL Database Integration</li>
              <li>✅ Password Hashing</li>
              <li>✅ Protected Routes</li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Dashboard;