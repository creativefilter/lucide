// Main App Component
const App = () => {
  // ... (existing state variables)
  const [currentPage, setCurrentPage] = useState('jobs'); // ADDED THIS LINE

  // ... (existing functions)

  return (
    <div className={`app-container ${theme === 'dark' ? 'dark-mode' : ''}`}>
      <style>
        {/* ... (existing styles) */}
      </style>
      <Header theme={theme} toggleTheme={toggleTheme} setCurrentPage={setCurrentPage} />
      <main className="main-content">
        {currentPage === 'jobs' && ( // ADDED CONDITIONAL RENDERING
          <>
            <JobControls
              onAddJob={handleAddJob}
            />
            <JobFilterSearch
              searchTerm={searchTerm}
              onSearchChange={setSearchTerm}
              selectedStatus={selectedStatus}
              onFilterChange={setSelectedStatus}
            />
            <JobList
              jobs={filteredJobs}
              onForceStart={handleForceStart}
              onHold={handleOnHold}
              onOffHold={handleOffHold}
              onKill={handleKill}
              onOnIce={handleOnIce}
              onRefreshData={refreshJobData}
              loadingJobIds={loadingJobIds}
              onJobNameClick={handleJobNameClick}
            />
          </>
        )}

        {currentPage === 'history' && ( // ADDED CONDITIONAL RENDERING FOR HISTORY PAGE
          <JobRunHistoryPage jobs={jobs} />
        )}

        {/* ... (existing modals) */}
      </main>
    </div>
  );
};
