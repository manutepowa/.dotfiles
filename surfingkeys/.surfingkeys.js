settings.showModeStatus = true;
settings.hintAlign = "left";
settings.focusFirstCandidate = true;
settings.scrollStepSize = 240;
settings.scrollSmoth = false;
settings.verticalTabs = true;
settings.modeAfterYank = "Normal";
settings.defaultLLMProvider = "gemini";
settings.llm = {
  gemini: {
    apiKey: "",
  }
}

const {
  aceVimMap,
  mapkey,
  imap,
  iunmap,
  imapkey,
  getClickableElements,
  vmapkey,
  map,
  unmap,
  cmap,
  addSearchAlias,
  removeSearchAlias,
  tabOpenLink,
  readText,
  Clipboard,
  Front,
  Hints,
  Visual,
  RUNTIME,
} = api;

// unmap("<ctrl-i>");
unmap("t");
unmap("H");
// Modified command to search in the same tab
// mapkey("<Alt-d>", "#8Open Search with Google in the same tab", function () {
//   Front.openOmnibar({ type: "SearchEngine", extra: "g", tabbed: false });
// });

map("t", "on");
map("H", "S");
map("L", "D");
map("<Alt-e>", ";U");
map("gt", "T");
map("<Alt-h>", "E"); // tab focus left
map("<Alt-l>", "R"); // tab focus right

// aceVimMap("kj", "<Esc>", "insert");
aceVimMap("q", ":q", "normal");
imap("kj", "<Esc>");

Hints.style("font-size: 12px; font-family: 'Source Code Pro', Ubuntu, sans;");
Hints.style(
  "border: solid 2px #C5C8C6 !important; padding: 1px !important; color: #1D1F21 !important; background: #C5C8C6 !important; font-size: 12px; font-family: 'Source Code Pro', Ubuntu, sans;",
  "text",
);

Visual.style("marks", "background-color: #A3BE8C99;");
Visual.style("cursor", "background-color: #88C0D0;");

settings.theme = `
/* Edit these variables for easy theme making */
:root {
  /* Font */
  --font: 'Source Code Pro', Ubuntu, sans;
  --font-size: 12;
  --font-weight: bold;
  /* -------------------- */
  /* --      NORD      -- */
  /* -------------------- */
  --fg: #E5E9F0;
  --bg: #3B4252;
  --bg-dark: #2E3440;
  --border: #4C566A;
  --main-fg: #88C0D0;
  --accent-fg: #A3BE8C;
  --info-fg: #5E81AC;
  --select: #4C566A;
}

/* ---------- Generic ---------- */
.sk_theme {
  background: var(--bg);
  color: var(--fg);
  background-color: var(--bg);
  border-color: var(--border);
  font-family: var(--font);
  font-size: var(--font-size);
  font-weight: var(--font-weight);
}

input {
  font-family: var(--font);
  font-weight: var(--font-weight);
}

.sk_theme tbody {
  color: var(--fg);
}

.sk_theme input {
  color: var(--fg);
}

/* Hints */
#sk_hints .begin {
  color: var(--accent-fg) !important;
}

#sk_tabs .sk_tab {
  background: var(--bg-dark);
  border: 1px solid var(--border);
}

#sk_tabs .sk_tab_title {
  color: var(--fg);
}

#sk_tabs .sk_tab_url {
  color: var(--main-fg);
}

#sk_tabs .sk_tab_hint {
  background: var(--bg);
  border: 1px solid var(--border);
  color: var(--accent-fg);
}

.sk_theme #sk_frame {
  background: var(--bg);
  opacity: 0.2;
  color: var(--accent-fg);
}

.sk_theme .title {
  color: var(--accent-fg);
}

.sk_theme .url {
  color: var(--main-fg);
}

.sk_theme .annotation {
  color: var(--accent-fg);
}

.sk_theme .omnibar_highlight {
  color: var(--accent-fg);
}

.sk_theme .omnibar_timestamp {
  color: var(--info-fg);
}

.sk_theme .omnibar_visitcount {
  color: var(--accent-fg);
}

.sk_theme #sk_omnibarSearchResult ul li:nth-child(odd) {
  background: var(--bg-dark);
}

.sk_theme #sk_omnibarSearchResult ul li.focused {
  background: var(--border);
}

.sk_theme #sk_omnibarSearchArea {
  border-top-color: var(--border);
  border-bottom-color: var(--border);
}

.sk_theme #sk_omnibarSearchArea input,
.sk_theme #sk_omnibarSearchArea span {
  font-size: var(--font-size);
}

.sk_theme .separator {
  color: var(--accent-fg);
}

/* ---------- Popup Notification Banner ---------- */
#sk_banner {
  font-family: var(--font);
  font-size: var(--font-size);
  font-weight: var(--font-weight);
  background: var(--bg);
  border-color: var(--border);
  color: var(--fg);
  opacity: 0.9;
}

/* ---------- Popup Keys ---------- */
#sk_keystroke {
  background-color: var(--bg);
}

.sk_theme kbd .candidates {
  color: var(--info-fg);
}

.sk_theme span.annotation {
  color: var(--accent-fg);
}

/* ---------- Popup Translation Bubble ---------- */
#sk_bubble {
  background-color: var(--bg) !important;
  color: var(--fg) !important;
  border-color: var(--border) !important;
}

#sk_bubble * {
  color: var(--fg) !important;
}

#sk_bubble div.sk_arrow div:nth-of-type(1) {
  border-top-color: var(--border) !important;
  border-bottom-color: var(--border) !important;
}

#sk_bubble div.sk_arrow div:nth-of-type(2) {
  border-top-color: var(--bg) !important;
  border-bottom-color: var(--bg) !important;
}

/* ---------- Search ---------- */
#sk_status,
#sk_find {
  font-size: var(--font-size);
  right: 5px;
  bottom: 5px;
  border-radius: 5px;
  padding-bottom: 3px;
}

.sk_theme kbd {
  background: var(--bg-dark);
  border-color: var(--border);
  box-shadow: none;
  color: var(--fg);
}

// .sk_theme .feature_name span {
//   color: var(--main-fg);
// }

/* ---------- ACE Editor ---------- */
#sk_editor {
  background: var(--bg-dark) !important;
  height: 50% !important;
  /* Remove this to restore the default editor size */
}

// .ace_dialog-bottom {
//   border-top: 1px solid var(--bg) !important;
// }

.ace-chrome .ace_print-margin,
.ace_gutter,
.ace_gutter-cell,
.ace_dialog {
  background: var(--bg) !important;
}

.ace-chrome {
  color: var(--fg) !important;
}

.ace_gutter,
.ace_dialog {
  color: var(--fg) !important;
}

.ace_cursor {
  color: var(--fg) !important;
}

.normal-mode .ace_cursor {
  background-color: var(--fg) !important;
  border: var(--fg) !important;
  opacity: 0.5 !important;
}

.ace_marker-layer .ace_selection {
  background: var(--select) !important;
}
`;
