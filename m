Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v3] dmaengine: mv_xor_v2: Fix clock resource by adding a register clock
From: Vinod Koul <vinod.koul@intel.com>
Message-Id: <20180311150423.GC15443@localhost>
Date: Sun, 11 Mar 2018 20:34:23 +0530
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: dmaengine@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Antoine Tenart <antoine.tenart@bootlin.com>, =?iso-8859-1?Q?Miqu=E8l?= Raynal <miquel.raynal@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Shadi Ammouri <shadi@marvell.com>, Omri Itach <omrii@marvell.com>, Hanna Hawa <hannah@marvell.com>, Igal Liberman <igall@marvell.com>, Marcin Wojtas <mw@semihalf.com>
List-ID: <dmaengine.vger.kernel.org>

T24gV2VkLCBNYXIgMDcsIDIwMTggYXQgMDQ6NDA6MTBQTSArMDEwMCwgR3JlZ29yeSBDTEVNRU5U
IHdyb3RlOgo+IE9uIHRoZSBDUDExMCBjb21wb25lbnRzIHdoaWNoIGFyZSBwcmVzZW50IG9uIHRo
ZSBBcm1hZGEgN0svOEsgU29DIHdlIG5lZWQKPiB0byBleHBsaWNpdGx5IGVuYWJsZSB0aGUgY2xv
Y2sgZm9yIHRoZSByZWdpc3RlcnMuIEhvd2V2ZXIgaXQgaXMgbm90Cj4gbmVlZGVkIGZvciB0aGUg
QVA4eHggY29tcG9uZW50LCB0aGF0J3Mgd2h5IHRoaXMgY2xvY2sgaXMgb3B0aW9uYWwuCj4gCj4g
V2l0aCB0aGlzIHBhdGNoIGJvdGggY2xvY2sgaGF2ZSBub3cgYSBuYW1lLCBidXQgaW4gb3JkZXIg
dG8gYmUgYmFja3dhcmQKPiBjb21wYXRpYmxlLCB0aGUgbmFtZSBvZiB0aGUgZmlyc3QgY2xvY2sg
aXMgbm90IHVzZWQuIEl0IGFsbG93cyB0byBzdGlsbAo+IHVzZSB0aGlzIGNsb2NrIHdpdGggYSBk
ZXZpY2UgdHJlZSB1c2luZyB0aGUgb2xkIGJpbmRpbmcuCgpBcHBsaWVkLCB0aGFua3MK
