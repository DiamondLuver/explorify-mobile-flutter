import React, { useState, useEffect } from 'react';
import axios from 'axios';

const PermissionManagement = () => {
  const [permissions, setPermissions] = useState([]);

  useEffect(() => {
    // Fetch permissions from Laravel API
    axios.get('http://localhost:8989/api/v1/admin/permissions')
      .then(response => {
        setPermissions(response.data);
      })
      .catch(error => {
        console.error('Error fetching permissions:', error);
      });
  }, []);

  return (
    <div>
      <h2>Permission Management</h2>
      <p>TEST</p>
      <p>TEST</p>
      <ul>
        {permissions.map(permission => (
          <li key={permission.id}>{permission.name}</li>
          
        ))}
      </ul>
    </div>
  );
};

export default PermissionManagement;
