Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,2/3] dmaengine: imx-sdma: Only check ratio on parts that support 1:1
From: Vinod Koul <vkoul@kernel.org>
Message-Id: <20190426114840.GV28103@vkoul-mobl>
Date: Fri, 26 Apr 2019 17:18:40 +0530
To: "Angus Ainslie (Purism)" <angus@akkea.ca>
Cc: angus.ainslie@puri.sm, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Dan Williams <dan.j.williams@intel.com>, Lucas Stach <l.stach@pengutronix.de>, Carlo Caione <ccaione@baylibre.com>, Daniel Baluta <daniel.baluta@nxp.com>, Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org
List-ID: <dmaengine.vger.kernel.org>

T24gMjktMDMtMTksIDA4OjIxLCBBbmd1cyBBaW5zbGllIChQdXJpc20pIHdyb3RlOgo+IE9uIGlt
eDhtcSBCMCBjaGlwLCBBSEIvU0RNQSBjbG9jayByYXRpbyAyOjEgY2FuJ3QgYmUgc3VwcG9ydGVk
LAo+IHNpbmNlIFNETUEgY2xvY2sgcmF0aW8gaGFzIHRvIGJlIGluY3JlYXNlZCB0byAyNTBNaHos
IEFIQiBjYW4ndCByZWFjaAo+IHRvIDUwME1oeiwgc28gdXNlIDE6MSBpbnN0ZWFkLgo+IAo+IFRv
IGxpbWl0IHRoaXMgY2hhbmdlIHRvIHRoZSBpbXg4bXEgZm9yIG5vdyB0aGlzIHBhdGNoIGFsc28g
YWRkcyBhbgo+IGltOG1xLXNkbWEgY29tcGF0aWJsZSBzdHJpbmcuCgpBcHBsaWVkLCB0aGFua3MK
