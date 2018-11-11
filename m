Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [1/2] firmware: add nowarn variant of request_firmware_nowait()
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-Id: <20181111174114.GA18543@kroah.com>
Date: Sun, 11 Nov 2018 09:41:14 -0800
To: Lucas Stach <l.stach@pengutronix.de>
Cc: "Luis R . Rodriguez" <mcgrof@kernel.org>, Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, patchwork-lst@pengutronix.de, kernel@pengutronix.de
List-ID: <dmaengine.vger.kernel.org>

T24gTW9uLCBOb3YgMDUsIDIwMTggYXQgMDY6MDI6MzFQTSArMDEwMCwgTHVjYXMgU3RhY2ggd3Jv
dGU6Cj4gRGV2aWNlIGRyaXZlcnMgd2l0aCBvcHRpb25hbCBmaXJtd2FyZSBtYXkgc3RpbGwgd2Fu
dCB0byB1c2UgdGhlCj4gYXN5bmNocm9ub3VzIGZpcm13YXJlIGxvYWRpbmcgaW50ZXJmYWNlLiBU
byBhdm9pZCBwcmludGluZyBhCj4gd2FybmluZyBpbnRvIHRoZSBrZXJuZWwgbG9nIHdoZW4gdGhl
IG9wdGlvbmFsIGZpcm13YXJlIGlzCj4gYWJzZW50LCBhZGQgYSBub3dhcm4gdmFyaWFudCBvZiB0
aGlzIGludGVyZmFjZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBMdWNhcyBTdGFjaCA8bC5zdGFjaEBw
ZW5ndXRyb25peC5kZT4KPiAtLS0KPiAgZHJpdmVycy9iYXNlL2Zpcm13YXJlX2xvYWRlci9tYWlu
LmMgfCA4NSArKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLQo+ICBpbmNsdWRlL2xpbnV4L2Zp
cm13YXJlLmggICAgICAgICAgICB8IDEyICsrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCA3MCBpbnNl
cnRpb25zKCspLCAyNyBkZWxldGlvbnMoLSkKCjAtZGF5IGJsZXcgdXAgb3ZlciB0aGlzLCBzbyBj
YW4geW91IGZpeCB0aGF0IHVwIGFuZCByZXNlbmQgdGhlIHNlcmllcz8KCnRoYW5rcywKCmdyZWcg
ay1oCg==
