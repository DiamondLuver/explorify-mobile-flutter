import React from 'react';

const ConfirmationPopup = ({ isOpen, onCancel, onConfirm }) => {
    if (!isOpen) return null;

    return (
        <div className="fixed inset-0 flex items-center justify-center bg-black bg-opacity-50">
            <div className="bg-white p-8 rounded-md shadow-lg">
                <p>Are you sure you want to delete this item?</p>
                <div className="flex justify-end mt-4">
                    <button onClick={onCancel} className="mr-4 bg-gray-200 hover:bg-gray-300 px-4 py-2 rounded-md">Cancel</button>
                    <button onClick={onConfirm} className="bg-red-500 hover:bg-red-600 text-white px-4 py-2 rounded-md">Delete</button>
                </div>
            </div>
        </div>
    );
};

export default ConfirmationPopup;
