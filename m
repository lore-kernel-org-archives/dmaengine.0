Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73C0235358
	for <dmaengine@vger.kernel.org>; Thu, 10 Sep 2026 02:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789008417; cv=none; b=Rf3RI6Ejxwg2Ch2LICOGC94aAdASWGBVYQisbOzP+6uXTbvejp/WBXnoFvrTlmuR3z+W1MOeqUJrjZsMEylPyOolr8SzOUGWO0l/8ceNFx/CRHNt4BQr3EBHLmZAjQJ/2SX3iQqfpLOTQgMuk/F4nFUToW0oVRKKYv233C61cPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789008417; c=relaxed/simple;
	bh=gAe7rYIbnQB+b4Wh8vb2CjS06Ligtp4oAhEocRMVwdU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=hRqo2Ay+WvUlg8/ZueJuZOi7ha5j3cqqRHwH91KO7OGvtihssqN6hdEYLRtnYiI+ZHi1kAMTVr769qA3h5VHbiRO7mtjx6SoDN/Aj7/CtnfDM6cO4uP3TQrgkezcNqzoSHuqkpwYTCyzA73PXnK0JXp9VkV1IUeOxs5uYS/E8QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=nzRSNH+l; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="nzRSNH+l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=gAe7rYIbnQB+b4Wh8vb2CjS06Ligtp4oAhEocRMVwdU=; b=n
	zRSNH+lxu+LpafQxU6B44fS45NI5rvaoWjoHLwxBeiE/65mC+yfLSbhdx3G0hhWI
	mIEuU9CD+QroiGbcyCePhAobPzvkgyJUUvWiOQTzlptZC9aJMftjaBLf3FnrX7QL
	5qNINxJFk6mGXv+4dRBcPoI956MCnXBIwxCufpa0QQ=
Date: Thu, 10 Sep 2026 10:46:27 +0800 (CST)
From: =?GBK?B?wO7T07roIA==?= <dayou5941@163.com>
To: "Vinod Koul" <vkoul@kernel.org>
Cc: Eugeniy.Paltsev@synopsys.com, Frank.Li@kernel.org,
	dmaengine@vger.kernel.org, "Li Youhong" <liyouhong@kylinos.cn>,
	"Frank Li" <Frank.Li@nxp.com>
Subject: Re:Re: [PATCH v4] dmaengine: dw-axi-dmac: convert to clk bulk APIs
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <aqFQHtOhhPOEmh8E@parshuram>
References: <20260903015438.2514100-1-dayou5941@163.com>
 <aqFQHtOhhPOEmh8E@parshuram>
X-NTES-SC: AL_Qu2TC/ybt0sj4SWdY+kckk4Wjug8Wcexufwj34NTc98FiDnyxQAgWH9YIH7x+t6mDx6MnzWOSARs6ftfZqR/WZfFynY3zge/BaonoIJFWA==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <590e2040.293c.1a089359df2.Coremail.dayou5941@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:hygvCgD3378EGqJqwXQMAA--.9882W
X-CM-SenderInfo: 5gd103ivzuiqqrwthudrp/xtbC3QTKeWqiGgRvbgAA39
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CgoKSGkgVmlub2QsCgpUaGFua3MgZm9yIHRoZSByZXZpZXcuCgoKQXQgMjAyNi0wOS0wOSAyMDoy
NTowMiwgIlZpbm9kIEtvdWwiIDx2a291bEBrZXJuZWwub3JnPiB3cm90ZToKPk9uIDAzLTA5LTI2
LCAwOTo1NCwgTGkgWW91aG9uZyB3cm90ZToKPj4gRnJvbTogTGkgWW91aG9uZyA8bGl5b3Vob25n
QGt5bGlub3MuY24+Cj4+IAo+PiBheGlfZG1hX3Jlc3VtZSgpIGVuYWJsZXMgY2Zncl9jbGsgdGhl
biBjb3JlX2Nsay4gSWYgZW5hYmxpbmcKPj4gY29yZV9jbGsgZmFpbHMsIHJldHVybiB3aXRob3V0
IGRpc2FibGluZyBjZmdyX2NsaywgbGVha2luZyB0aGUKPj4gYWxyZWFkeS1lbmFibGVkIGNsb2Nr
Lgo+PiAKPj4gU3dpdGNoIGJvdGggY2xvY2tzIHRvIHRoZSBjbGsgYnVsayBoZWxwZXJzIHNvIHBy
ZXBhcmUvZW5hYmxlCj4+IGZhaWx1cmVzIHJvbGwgYmFjayBhdXRvbWF0aWNhbGx5LCBhbmQgdXBk
YXRlIHByb2JlL3JlbW92ZS8KPj4gc3VzcGVuZC9yZXN1bWUgYWNjb3JkaW5nbHkuCj4+IAo+PiBJ
biBkd19yZW1vdmUoKSwgY2hlY2sgY2xrX2J1bGtfcHJlcGFyZV9lbmFibGUoKS4gT24gZmFpbHVy
ZSBza2lwCj4+IE1NSU8gYW5kIHRoZSBtYXRjaGluZyBkaXNhYmxlIHRvIGF2b2lkIHVuYmFsYW5j
ZWQgY2xrIGRpc2FibGU7Cj4+IGFsd2F5cyBjb250aW51ZSB3aXRoIElSUS9PRi90YXNrbGV0IHRl
YXJkb3duLgo+Cj5IZXksIHRoaXMgZG9lc25vdCBhcHBseSBhZ2FpbnN0IGN1cnJlbnQgY29kZSwg
Y2FuIHlvdSByZWJhc2UgYW5kIHNlbmQKCldoZW4gSSByZWJhc2VkIG9udG8gdGhlIGRtYWVuZ2lu
ZS9uZXh0IGJyYW5jaCwgSSBmb3VuZCB0aGlzIGlzc3VlIGhhcyBhbHJlYWR5IGJlZW4gZml4ZWQg
YnkgY29tbWl0OgpjODQzNDE3ZTZkNmIgKCJkbWFlbmdpbmU6IGR3LWF4aS1kbWFjOiBjb252ZXJ0
IGNsb2NrIGhhbmRsaW5nIHRvIGNsa19idWxrIEFQSSIpCgpTbyBJIHdpbGwgZHJvcCB0aGlzIHBh
dGNoIHNlcmllcy4KCj4+IAo+PiBGaXhlczogMWZlMjBmMWI4NDU0ICgiZG1hZW5naW5lOiBJbnRy
b2R1Y2UgRFcgQVhJIERNQUMgZHJpdmVyIikKPgo+d2h5IGlzIHRoaXMgYSBmaXg/Cgo+CgpSZWdh
cmRpbmcgdGhlIEZpeGVzIHRhZzogc3RhcnRpbmcgZnJvbSBjb21taXQgMWZlMjBmMWI4NDU0LCBh
eGlfZG1hX3Jlc3VtZSgpIGVuYWJsZXMgY2Zncl9jbGsgCmZpcnN0IGFuZCB0aGVuIGNvcmVfY2xr
LiBJZiBlbmFibGluZyBjb3JlX2NsayBmYWlscywgdGhlIGZ1bmN0aW9uIHJldHVybnMgaW1tZWRp
YXRlbHkgd2l0aG91dCAKZGlzYWJsaW5nIHRoZSBhbHJlYWR5IGVuYWJsZWQgY2Zncl9jbGsuIFRo
YXQgaXMgd2h5IEkgcmVmZXJlbmNlZCB0aGF0IEZpeGVzIGNvbW1pdC4gTm93IHRoYXQgCmM4NDM0
MTdlNmQ2YiBpcyBpbiBtYWlubGluZSwgbXkgcGF0Y2ggaXMgbm8gbG9uZ2VyIG5lZWRlZC4KClNv
cnJ5IGZvciB0aGUgbm9pc2UuCgpUaGFua3MsCkxpIFlvdWhvbmcKCj4tLSAKPn5WaW5vZAo=
