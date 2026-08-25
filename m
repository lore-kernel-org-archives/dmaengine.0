Received: from out162-62-58-211.mail.qq.com (out162-62-58-211.mail.qq.com [162.62.58.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19153E3D92;
	Tue, 25 Aug 2026 09:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.58.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787649266; cv=none; b=J2NjyKj5vcoFcwslkw/JBtD6OOXhDyPDHsFohyNA3QXVPgcHVRSj6OnnolTkPbMftULNEpsbCKCx8zuRA8wNS2w8MIkgGpNrgPxhNPHPUOtqZrN7yIjNzjl+cgrjo4Y3BIKoeyhMOrBY9BOP5W/CPPXrWIy9d2dGOsZxbksSNW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787649266; c=relaxed/simple;
	bh=WQ4K727RmnRurI4h8eDfDrxORI1rM8ohIIdhGZ40I8U=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=gj9rIKYrn5bN6DwTJPVkWNIvuDjUMM8KFr5S/63nRfN32dwiGLFS0Z0U8Tyh99bTaof24iPdA+fHrltfk3aKmyvovnye3ODWz879E9tvdYyADcDmmRerhpjodQMRE6k3iMu9ZCFjeLcNv72ExdIVZQOONT6+y+uRLuhtN1n61HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=YsQ3+j7a; arc=none smtp.client-ip=162.62.58.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="YsQ3+j7a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1787649260; bh=WQ4K727RmnRurI4h8eDfDrxORI1rM8ohIIdhGZ40I8U=;
	h=Date:To:Cc:From:Subject;
	b=YsQ3+j7a8aTQciZVdtLA5bL4ZBeRZFTwUa+Goo/tFeRFwDO6Hkq/nm0/foUGVwjHe
	 uukHy4otVhK7IW9nPJZdaKwjGH0yY36R2SNam8KPTfW/MAawyeKa0cPmiwgOuArEBE
	 Y7WWn/GJy3c3KM+5Q2zkQ0Ag+zNA7jKKjBVATfZk=
Received: from [192.168.255.10] ([111.206.145.19])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id 3919EA8F; Tue, 25 Aug 2026 17:14:17 +0800
X-QQ-mid: xmsmtpt1787649257t7qbkovhk
Message-ID: <tencent_629A33A5198254C3EC75AF7CB18050796F07@qq.com>
X-QQ-XMAILINFO: MhK4DKsBP06iig66I255AbmhcKRkArSQhMtJikEdJwTdjUVSVQ4gppjeYY3Irm
	 +HZRXKtmCl6IZBPjahAuKmYW3L8+0rD1GjSWNUzPPtY2O5pyHh2Jj15/Ssl6TOnBbtrziJrXkEuz
	 HEKeuRt2Uu3CsinLwn0oTxNnCXKOZ8d8USm2itSjcxxH2a7VaLfP4Eu2h5Sr5049bMHz9vZGn6ft
	 Ektrx+lbSudGBpvs/tcJjYC+bD06eLMPjgoNTzyul0fcUNdfLT0zmMxERgKKgUaAW28Tv+qZ7aEB
	 sbU9QMOJZnhm76p4hguGiEDJ+3rCsEspYX/fos55LVObJwOz0HZJ2lrHvy74nkuSYgIYpUcqCFWI
	 UCg+VCY43i9gXUol0QHv9Sgj4k9JOU3T+MEn3GH6GnQIdFi3krqXOUw/fx4gvI5ft1/yyaCgTrZJ
	 GdRlKgfNQOAaPnLrLJQZ+Wy1IhDujrGk+i2MoDTxwvvLxdFXIpnsocK7qSiS8SbsASFtWW/nrDus
	 eqXaKK7B+1SlU5HyqAgYf3qkcjd0bf8qbyuSKZ80+200P31yoZz8yn7ZTcRA57djIfQ2Pqzfhkks
	 +DFB8xOOn6gGHEdLwYW/65tcw+2kYdLxZu1t3xu6VN2zfHth20RNKtr1uAQugbjvKgf4Eqh84n6E
	 9gm9BvOUDseGuxq82ecHaKivs1b0oE6+Mw/d5MoqgnvaVUv4GI+e14LrtZHhtpvGrSxZL+mjQiY2
	 bLrKjaKcccfTOmC82AN0bVeDYVeKYfqx2vogkzT78m8ny+2zcTT6EEQtyc9/4JqK/ADP3jkDQEk0
	 h1htqKrS5uSqCEb8Q3+AHYsDNg4HNGGdcREC8iALpagDUfO/7CqdfgfjC5Uvl3jTyNzIAuLv68G8
	 8X8sYFKNo2K777GeNe2Y/yXjYGsvqwFONQ0qrcuCeyjYZxpW4sIZSythtb+BGba4msF2U0aB8208
	 sqgrROf34fyQ8qZIuMniwsk5bWm2OgQoSZInZTctapEt0I6LLKkuC+aEsYvNUn/8GqManDnC9zkb
	 rQu58qu9GjXIn1Swm838BVXVchTPYyY8c88pXe9G4cgQe81vyFn2ubwvU8cyUGoHrWYFRzaMbQHd
	 sVNtbTh60yTk6ufcv3gRqeoJ9vOg==
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-OQ-MSGID: <a50048e9-ae07-4775-a6c7-55c44ce73385@qq.com>
Date: Tue, 25 Aug 2026 17:14:16 +0800
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: dave.jiang@intel.com, vkoul@kernel.org, dmaengine@vger.kernel.org
Cc: Frank.Li@kernel.org, linux-kernel@vger.kernel.org
From: Yang Zi <2959243019@qq.com>
Subject: [PATCH] dmaengine: ioatdma: Fix NULL pointer dereference in
 ioat_alloc_chan_resources()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

ioat_alloc_chan_resources() performs MMIO accesses using
ioat_chan->reg_base without validating that the device's BAR mapping
(ioat_chan->ioat_dma->reg_base) is valid.  If the PCI BAR is not
properly mapped, reg_base is NULL and the channel's reg_base is computed
as NULL plus a small channel offset, so the first writew() touches an
address near NULL and faults.

KASAN/Oops report:

    BUG: kernel NULL pointer dereference, address: 0000000000000181
    #PF: supervisor write access in kernel mode
    #PF: error_code(0x0002) - not-present page
    RIP: 0010:ioat_alloc_chan_resources+0x40b/0x1ff0 [drivers/dma/ioat/init.c:679]

Validate the MMIO base before any register access and return -ENODEV if
it is not mapped.

Signed-off-by: Yang Zi <2959243019@qq.com>
---
 drivers/dma/ioat/init.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/dma/ioat/init.c b/drivers/dma/ioat/init.c
index 737496391109..80dc8f36c346 100644
--- a/drivers/dma/ioat/init.c
+++ b/drivers/dma/ioat/init.c
@@ -677,6 +677,10 @@ static int ioat_alloc_chan_resources(struct dma_chan *c)
     if (ioat_chan->ring)
         return 1 << ioat_chan->alloc_order;
 
+    /* Validate the MMIO base before any register access. */
+    if (!ioat_chan->ioat_dma->reg_base)
+        return -ENODEV;
+
     /* Setup register to interrupt and write completion status on error */
     writew(IOAT_CHANCTRL_RUN, ioat_chan->reg_base + IOAT_CHANCTRL_OFFSET);
 

