# 1472. Design Browser History
# Stack solution


class BrowserHistory:
    def __init__(self, homepage: str):
        self.history = [homepage]
        self.i = 0
        self.length = 1

    def visit(self, url: str) -> None:
        self.i += 1
        self.length = self.i + 1
        if self.length > len(self.history):
            self.history.append(url)
        else:
            self.history[self.i] = url

    def back(self, steps: int) -> str:
        self.i -= steps
        if self.i < 0:
            self.i = 0
        return self.history[self.i]

    def forward(self, steps: int) -> str:
        self.i += steps
        if self.i >= self.length:
            self.i = self.length - 1
        return self.history[self.i]


# Your BrowserHistory object will be instantiated and called as such:
# obj = BrowserHistory(homepage)
# obj.visit(url)
# param_2 = obj.back(steps)
# param_3 = obj.forward(steps)
