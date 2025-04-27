import * as vscode from "vscode";
import * as path from "path";

export function activate(context: vscode.ExtensionContext) {
  let disposable = vscode.commands.registerCommand(
    "phpmigration-file-switcher.openRelated",
    async () => {
      const editor = vscode.window.activeTextEditor;
      if (!editor) {
        return vscode.window.showErrorMessage("There is no active editor.");
      }

      const filePath = editor.document.uri.fsPath;
      const workspaceFolders = vscode.workspace.workspaceFolders;
      if (!workspaceFolders) {
        return vscode.window.showErrorMessage(
          "Could not find the workspace folder.",
        );
      }
      const rootPath = workspaceFolders[0].uri.fsPath;
      const buildPath = path.join(rootPath, "php", "build");

      // Capture the current selection or word under cursor for later focus
      const rawSelection = editor.document.getText(editor.selection).trim();
      let searchTerm = rawSelection;
      if (!searchTerm) {
        const wordRange = editor.document.getWordRangeAtPosition(
          editor.selection.active,
        );
        searchTerm = wordRange ? editor.document.getText(wordRange).trim() : "";
      }

      let targetPath: string;
      if (filePath.includes(buildPath)) {
        targetPath = filePath.replace(buildPath + path.sep, "");
        targetPath = path.join(rootPath, targetPath);
      } else {
        const relativePath = path.relative(rootPath, filePath);
        targetPath = path.join(rootPath, "php", "build", relativePath);
      }

      const targetUri = vscode.Uri.file(targetPath);
      try {
        await vscode.workspace.fs.stat(targetUri);
        const doc = await vscode.workspace.openTextDocument(targetUri);
        // await vscode.window.showTextDocument(doc, { preview: false });
        const newEditor = await vscode.window.showTextDocument(doc, {
          preview: false,
        });
        // If we have a search term, find and reveal it in the new editor
        if (searchTerm) {
          const fullText = doc.getText();
          const idx = fullText.indexOf(searchTerm);
          if (idx !== -1) {
            const start = doc.positionAt(idx);
            const end = doc.positionAt(idx + searchTerm.length);
            newEditor.selection = new vscode.Selection(start, end);
            newEditor.revealRange(
              new vscode.Range(start, end),
              vscode.TextEditorRevealType.InCenter,
            );
            // Open the find widget with the current search term
            await vscode.commands.executeCommand(
              "editor.actions.findWithArgs",
              {
                searchString: searchTerm,
                isRegex: false,
                matchCase: false,
                preserveCase: false,
              },
            );
          }
        }
      } catch (err) {
        vscode.window.showErrorMessage("The file does not exist.");
      }
    },
  );

  context.subscriptions.push(disposable);
}

// This method is called when your extension is deactivated
export function deactivate() {}
