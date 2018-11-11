Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [for-stable] dmaengine: stm32-dma: fix incomplete configuration in cyclic mode
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-Id: <20181111011105.GA18060@kroah.com>
Date: Sat, 10 Nov 2018 17:11:05 -0800
To: "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: stable@vger.kernel.org, Pierre Yves MORDRET <pierre-yves.mordret@st.com>, Hugues Fruchet <hugues.fruchet@st.com>, Vinod Koul <vinod.koul@intel.com>, Alexandre Torgue <alexandre.torgue@st.com>, Dan Williams <dan.j.williams@intel.com>, dmaengine@vger.kernel.org, "moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>
List-ID: <dmaengine.vger.kernel.org>

T24gVHVlLCBPY3QgMTYsIDIwMTggYXQgMDU6MDA6MDNQTSAtMDcwMCwgSm9lbCBGZXJuYW5kZXMg
KEdvb2dsZSkgd3JvdGU6Cj4gRnJvbTogUGllcnJlIFl2ZXMgTU9SRFJFVCA8cGllcnJlLXl2ZXMu
bW9yZHJldEBzdC5jb20+Cj4gCj4gY29tbWl0IGU1N2NiM2IzZjEwZDAwNTQxMGYwOWQ0NTk4Y2M2
ZDYyYjgzM2YyYjAgdXBzdHJlYW0uCj4gCj4gV2hlbiBpbiBjeWNsaWMgbW9kZSwgdGhlIGNvbmZp
Z3VyYXRpb24gaXMgdXBkYXRlZCBhZnRlciBoYXZpbmcgc3RhcnRlZCB0aGUKPiBETUEgaGFyZHdh
cmUgKFNUTTMyX0RNQV9TQ1JfRU4pIGxlYWRpbmcgdG8gaW5jb21wbGV0ZSBjb25maWd1cmF0aW9u
IG9mCj4gU014QVIgcmVnaXN0ZXJzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBpZXJyZS1ZdmVzIE1P
UkRSRVQgPHBpZXJyZS15dmVzLm1vcmRyZXRAc3QuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEh1Z3Vl
cyBGcnVjaGV0IDxodWd1ZXMuZnJ1Y2hldEBzdC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogVmlub2Qg
S291bCA8dmlub2Qua291bEBpbnRlbC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZG1hL3N0bTMyLWRt
YS5jIHwgOCArKysrKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQoKSSdtIGp1c3QgZ3Vlc3NpbmcgeW91IHdhbnQgdGhpcyBmb3IgNC4xNC55PyAg
SSd2ZSBhZGRlZCBpdCB0aGVyZS4gIElmCm5vdCwgcGxlYXNlIGdpdmUgbWUgYSBoaW50IDopCg==
