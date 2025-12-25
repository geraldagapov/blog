# Project Workflow

## Guiding Principles

1. **The Plan is the Source of Truth:** All work must be tracked in `plan.md`
2. **The Tech Stack is Deliberate:** Changes to the tech stack must be documented in `tech-stack.md` *before* implementation
3. **Test-Driven Development:** Write unit tests before implementing functionality
4. **High Code Coverage:** Aim for >80% code coverage for all modules
5. **User Experience First:** Every decision should prioritize user experience
6. **Non-Interactive & CI-Aware:** Prefer non-interactive commands. Use `CI=true` for watch-mode tools (tests, linters) to ensure single execution.

## Task Workflow

All tasks follow a strict lifecycle:

### Standard Task Workflow

1. **Select Task:** Choose the next available task from `plan.md` in sequential order

2. **Mark In Progress:** Before beginning work, edit `plan.md` and change the task from `[ ]` to `[~]`

3. **Write Failing Tests (Red Phase):**
   - Create a new test file for the feature or bug fix.
   - Write one or more unit tests that clearly define the expected behavior and acceptance criteria for the task.
   - **CRITICAL:** Run the tests and confirm that they fail as expected. This is the "Red" phase of TDD. Do not proceed until you have failing tests.

4. **Implement to Pass Tests (Green Phase):**
   - Write the minimum amount of application code necessary to make the failing tests pass.
   - Run the test suite again and confirm that all tests now pass. This is the "Green" phase.

5. **Refactor (Optional but Recommended):**
   - With the safety of passing tests, refactor the implementation code and the test code to improve clarity, remove duplication, and enhance performance without changing the external behavior.
   - Rerun tests to ensure they still pass after refactoring.

6. **Verify Coverage:** Run coverage reports using the project's chosen tools.
   Target: >80% coverage for new code.

7. **Verify Build:** Run the build command to ensure the website builds successfully.
   Command: `bundle exec jekyll build`

8. **Document Deviations:** If implementation differs from tech stack:
   - **STOP** implementation
   - Update `tech-stack.md` with new design
   - Add dated note explaining the change
   - Resume implementation

9. **Commit Code Changes:**
   - Review changes with `jj diff`.
   - Set the commit message:
     ```bash
     jj describe -m "<type>(<scope>): <description>"
     ```
   - Finalize the commit and start a new working copy:
     ```bash
     jj new
     ```

10. **Append Task Summary to Commit:**
   - **Step 10.1: Draft Note Content:** Create a detailed summary including task name, changes, files modified, and "why".
   - **Step 10.2: Append to Commit Description:** Update the description of the *just-completed commit* (`@-`) to include the note.
     ```bash
     # Example: Appending to the previous commit's description
     jj describe @- -m "$(jj log --no-graph -r @- -T description)

     Task Summary: <note content>"
     ```

11. **Get and Record Task Commit SHA:**
    - **Step 11.1: Get Commit Hash:**
      ```bash
      jj log --no-graph -r @- -T "commit_id"
      ```
    - **Step 11.2: Update Plan:** Read `plan.md`, find the line for the completed task, update its status from `[~]` to `[x]`, and append the first 7 characters of the hash.
    - **Step 11.3: Write Plan:** Write the updated content back to `plan.md`.

12. **Commit Plan Update:**
    - **Action:** Set the message for the plan update:
      ```bash
      jj describe -m "conductor(plan): Mark task '...' as complete"
      ```
    - **Action:** Finalize:
      ```bash
      jj new
      ```

### Phase Completion Verification and Checkpointing Protocol

**Trigger:** This protocol is executed immediately after a task is completed that also concludes a phase in `plan.md`.

1.  **Announce Protocol Start:** Inform the user that the phase is complete and the verification and checkpointing protocol has begun.

2.  **Ensure Test Coverage for Phase Changes:**
    -   **Step 2.1: Determine Phase Scope:** Read `plan.md` to find the SHA of the *previous* phase's checkpoint.
    -   **Step 2.2: List Changed Files:** Execute `jj diff --from <previous_checkpoint_sha> --to @- --summary` (or similar) to identify modified files.
    -   **Step 2.3: Verify and Create Tests:** Check code files for corresponding tests. Create missing tests if necessary.

3.  **Execute Automated Tests with Proactive Debugging:**
    -   **Announce Command:** e.g., "Command: `CI=true npm test`"
    -   **Execute:** Run the command.
    -   **Debug:** If failure, propose up to 2 fixes.

4.  **Propose a Detailed, Actionable Manual Verification Plan:**
    -   Generate a step-by-step plan (Frontend/Backend specific as needed).

5.  **Await Explicit User Feedback:**
    -   **Ask:** "**Does this meet your expectations? Please confirm with yes or provide feedback...**"
    -   **PAUSE** and await response.

6.  **Create Checkpoint Commit:**
    -   Set message:
      ```bash
      jj describe -m "conductor(checkpoint): Checkpoint end of Phase X"
      ```
    -   Finalize:
      ```bash
      jj new
      ```

7.  **Append Auditable Verification Report:**
    -   **Step 8.1: Draft Report:** Include automated test results, manual steps, and user confirmation.
    -   **Step 8.2: Append to Commit:**
      ```bash
      jj describe @- -m "$(jj log --no-graph -r @- -T description)

      Verification Report: <report content>"
      ```

8.  **Get and Record Phase Checkpoint SHA:**
    -   **Step 7.1: Get Commit Hash:** `jj log --no-graph -r @- -T "commit_id"`
    -   **Step 7.2: Update Plan:** Append `[checkpoint: <sha>]` to the phase heading in `plan.md`.

9. **Commit Plan Update:**
    - **Action:** `jj describe -m "conductor(plan): Mark phase '<PHASE NAME>' as complete"`
    - **Action:** `jj new`

10.  **Announce Completion:** Inform the user.

### Quality Gates

Before marking any task complete, verify:

- [ ] All tests pass
- [ ] Code coverage meets requirements (>80%)
- [ ] Website builds successfully (`bundle exec jekyll build`)
- [ ] Code follows project's code style guidelines
- [ ] All public functions/methods are documented
- [ ] Type safety is enforced
- [ ] No linting or static analysis errors
- [ ] Works correctly on mobile (if applicable)
- [ ] Documentation updated if needed
- [ ] No security vulnerabilities introduced

## Development Commands

### Setup
```bash
# Example: npm install
```

### Daily Development
```bash
# Example: npm run dev, npm test
```

### Before Committing
```bash
# Example: npm run check
```

## Testing Requirements
(Same as before)

## Code Review Process
(Same as before)

## Commit Guidelines

### Message Format
```
<type>(<scope>): <description>

[optional body]

[optional footer]
```

## Definition of Done

A task is complete when:
1. All code implemented to specification
2. Unit tests written and passing
3. Code coverage meets requirements
4. Website builds successfully
5. Documentation complete
6. Code passes linting/analysis
7. Mobile verified
8. Implementation notes added to `plan.md`
9. Changes committed with proper message (`jj describe`, `jj new`)
10. Task summary appended to commit description

## Emergency Procedures

### Critical Bug in Production
1. `jj new main` (create new change off main)
2. Write failing test
3. Implement fix
4. Test
5. Deploy
6. Document