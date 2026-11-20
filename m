Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795202976;
	b=Y/rJRWhMb6+eaANTa6Rh/Bg3ShI6EwQHS4L3/I4lrknPBdshgb/7c2bnumeH5OIOeEMs
	 8/L678dx3M2ewf6jZneIMWTeIWhCCrVaaHwMhr1eJzz7BF9JIYIUqB9StJ+Rr/SxrYFL3
	 sv3TQURv8Xxn8s/idGdl4DKSomNeT29txcxAjeKzDEncJpsjyv3Jy2Myi1R1FX6xnfnl5
	 SEuz2axIY3UUcPgeUjFB2guxRqLYO8Tq/OuqoL5Islk0NMGiPxr4Tjpj1h9dg1NesFkSK
	 zcAdiNKQvHJQCIjForTww28J40vAfZBAtAB/+V5rkAxDlXYvN+z4CRt44D5VSFnwuIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202976;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=HgAhw8d5YaKxhipigIjxpyoY1rnfpWAZBnQgXb85Z0s=;
	b=r/5uVBQOTqsiM75dx6fnQJolOT/UQmPNX4MyU+KNyzUFJqPUlgT5EAkFczd/9NgzL0KU
	 ++1a9BvkDSpQs6+WPDFZcLySJhDYMA5e/T4UokLrxqIur5hRugPAUxixJE6kyB/KvCiV+
	 +jGUVgag92Ew049q4mQSDtlnSvHqkPntmtsqWoZHUXiPakgXggbxIj0fQQvgo6oAgNXhR
	 ZkvxoZUYImWkXgUkHD7teUV3fYHOcYdYx4veQ5XdRHwvRfOwytUuADlbwUGXH29VpISlL
	 O/naEqLOKlF6XtYlFnD6Fh0QL/ohesXy7x1MkuWDKiz+L4qj3c6uC0Ufm3PgXG3cWnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="AMc/O9rv";
	arc=none smtp.remote-ip=209.85.161.47
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F4660A2621
	for <dmaengine@vger.kernel.org>; Fri, 20 Nov 2026 19:29:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0F4660A2621
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AMc/O9rv
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-71b47eede22so185559eaf.2
        for <dmaengine@vger.kernel.org>; Fri, 20 Nov 2026 11:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795202965; x=1795807765; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HgAhw8d5YaKxhipigIjxpyoY1rnfpWAZBnQgXb85Z0s=;
        b=AMc/O9rvrWAOFSHNAZc0dEv5FdYm+9X8d3+iGUjnqCUmleO2ZoOaXnA79f2QfP6zA0
         0A4ZwFdx5PpMdIqbCMlzik05E5roocUnTUWgap9FrqK4nBdbDKch4p/jENyuBXwlrKAp
         Jrt3w46wyVyIsLUTCUKO5JfqAAsPy5anDy/tKp7xp5ojFRCpO5tsgrg6/WVxL1SUTew0
         seL/FvxrjA9arO+1xGAlecaMB/p3YeWal23LRSa/vJiy6cf2P35umEn3i4QgV457o73L
         BeO5mvZRLCgwwy7quIVn05j2JSz545+fhRj/2Y2TJH/szJMv+0NLPqOzqhn8MCLOdm1T
         RDsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202965; x=1795807765;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HgAhw8d5YaKxhipigIjxpyoY1rnfpWAZBnQgXb85Z0s=;
        b=w2R4qOh5h+K0hwpLM5T57PJBJlKUIutXnv+eO3U+pH5aKpGtccCPgswdStN65thcbw
         pz795F5r0SZ0RpmOWCdLYJ57YaNzzJk2vk+M1H9LEi2b76X4z8olAUDTuVR/u/Xgvql1
         IcXrI0XFqU0HlN38Qzf5UuXnnyDzjQs7aBfr/4owukF1utI6MsLrAP+PyQtIZmLM04hL
         RWuGOHVcIqZBOCJHzom1e0U/2cEUjTIT5vneUenAA+zCzLh/Y3yyfEInbm/JBs8B8ex2
         SQ+a7KiViJUZP3I/dHPy3XMiu/+3TpM8o6lfQdbUmSK5nfG9wtjy9vSwry2dCnOl3upN
         XE1w==
X-Forwarded-Encrypted: i=1; AL+hErHYhv3moOD7I1x3DeKC3d0O6zGPQKDZLRwcDujsWLGYHsj2Y/i6hw1wIdgtk3KGYTd28tSAhu9s6+o=@vger.kernel.org
X-Gm-Message-State: APuU4Z+nRvsiCDzAWtwcs0lMZGGrALUNxn1YdKCo4ii2JV9j+FKfiR3x
	kFwd/BA2Sy19Is4B18f7O14dPPryr6+HIx1Yt5LiOANoyMRxDFVwU02A
X-Gm-Gg: AYBFou3gr+E07fzDRY2Y6P4JBsUTp0rrjXT3co63+QPtbdZsxXxE7YPuAUSXHqNCDxs
	wfjtidzBr73tLvwFRp7WBiu1PvRzesp9vxpIYZ/lUdumf77MzaWPgRKIRoTkp8WqeGCBVRi4fT0
	KHsj5fFF32Z37T43qaksXCXrUPOU5Uk9nuWj3HS3q4yZW1pXqyW+kmPFmXt9eQbzZMMn6wzg+iV
	V/M9lV2N3nIQ2bbo//DAOLTDg1DSH52fQnutt6gSQmblxfUNckTatxTyE18hfC34XMm/at0c/hj
	ndhYoPQesPjc8HytTFkaz5dEcYfOI9DjL9KobmtHAl1kybM6genM1jU+ywfJ5qpA0SDQvif7TRN
	KkGwo5nCJBAK8i0ei8ZmqzW2P63iHTnf0DYYRAnTeXI7LyHFZCNEHwkE7Jwddzbfbnx57me9SH3
	plcJFI4wS4p4eRNuKMkAkeSs9vppG83L6ZL+aaBpmV/5VNuim0MoguFMbcmXGlNESNJym3r/XDy
	jBaLq7/Sd+f5eoxxpA4C1OJewDBAxVjccVzjemkErgj+yqKXPVmyEQihgTzvjDWbJ+UiNBxvYOZ
	v5BUGYyOVhIhiIYmS58bUspkW64M54uk+ekUPdDwc+VHOLlBre9Htjia+n2xMCqICN7SW2wYOQz
	JeevAg8XgviRMTClRcLF3Hisy/WJYKiH5yvVp6vCZeNRDwRsdFKnNg4vwaoPDDpWUk41OYek2pv
	Zb3ZNbsJXPAGY+KUXUcMowzy7y659E8RAkKs24mghtjxV6EUO2t8uP
X-Received: by 2002:a05:6820:c451:10b0:71a:f8c9:c6bc with SMTP id 006d021491bc7-71b39507d6fmr2684229eaf.55.1795202965405;
        Fri, 20 Nov 2026 11:29:25 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc5f7ae7dcsm3434498fac.8.2026.11.20.11.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:29:24 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 12:29:13 -0700
Subject: [PATCH v11 7/7] dmaengine: dw: report residue for queued transfers
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-submit-dw-dma-synchronize-v1-v11-7-9b9166bc2cc7@gmail.com>
References: <20261120-submit-dw-dma-synchronize-v1-v11-0-9b9166bc2cc7@gmail.com>
In-Reply-To: <20261120-submit-dw-dma-synchronize-v1-v11-0-9b9166bc2cc7@gmail.com>
To: Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Dan Williams <djbw@kernel.org>
Cc: Serge Semin <fancer.lancer@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 dmaengine@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.17-dev

A submitted transfer may still be queued behind the active transaction.
dwc_find_desc() only checks the active descriptor, so a status query
reports zero residue for a queued cookie even though none of its data has
been transferred.

Search the issued and submitted queues as well. vchan_find_desc() covers
issued descriptors; submitted descriptors need a separate lookup. The
status getter already reports total_len for a descriptor that is not the
active transaction, giving queued transfers their full remaining length.

Fixes: b68fd0976286 ("dmaengine: dw: move residue to a descriptor")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw/core.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/dma/dw/core.c b/drivers/dma/dw/core.c
index 7a66dc75c546..f9761651c7ec 100644
--- a/drivers/dma/dw/core.c
+++ b/drivers/dma/dw/core.c
@@ -942,9 +942,19 @@ static void dwc_synchronize(struct dma_chan *chan)
 
 static struct dw_desc *dwc_find_desc(struct dw_dma_chan *dwc, dma_cookie_t c)
 {
+	struct virt_dma_desc *vd;
+
 	if (dwc->desc && dwc->desc->vd.tx.cookie == c)
 		return dwc->desc;
 
+	vd = vchan_find_desc(&dwc->vc, c);
+	if (vd)
+		return vd_to_dw_desc(vd);
+
+	list_for_each_entry(vd, &dwc->vc.desc_submitted, node)
+		if (vd->tx.cookie == c)
+			return vd_to_dw_desc(vd);
+
 	return NULL;
 }
 

-- 
2.53.0

