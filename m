Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C4442DA45
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 20:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785184840; cv=none; b=BF/Cndlwd8Rsxl+Osn2GkF+7UuazW4oZXsH97QJ8y0kusBoqTzdaxdMSTYtYiXg3nYdX1Iy+qqoLpAsye2SEyObTw9jXc6MttjojjUq4e1Twr+Yq6ZwlabcxB0ULoicfEwSx5tZDAQTCgAVK9a2jytxJQtqyd4bWZXBP3sPxPZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785184840; c=relaxed/simple;
	bh=Jc5s8ntFgrgJq71wWR66+FBEa9iajOehKE11jh9756k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jyp3MPox2HTVaA8uZfoxpSjQCEmcb9JwRiwUrcTm0SRoZyPlGXWFXTvFzQcoZIrfJIhovmCH5I/hUjJZfu324BCiWUJ/1rAictsyUjQscHAotTqVclYGMA+U0yhEpNsz/D9H6EzopeMUVmc8dEyFB5AC6+FNnRLaego5vrR7HHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dxR797uA; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dxR797uA"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-848d21bbaffso3240888b3a.0
        for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 13:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184838; x=1785789638; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ELjPly7GR36YIzSkxqnCCbI/tjI0YA2AC2jjG4KaPeQ=;
        b=dxR797uAxqfegwpxI93+xLS2ZDx6SVgNGWlkAE9wDgBVYxX8MW7fOOBmVvk7Afwowh
         TX4IQWknK7N39FBIhssemL2w4Cn1SHKS3bCEv5NM89oxrmmWB+fTUlXtYQD5v0Klybpl
         by1uig6pydKNigGZSBgNnFkzA3H/DdlVskaK9NqM91tM4oHzvuQJxptdjBurqfWpyFeT
         ob+9EM99BkdDD2MzygFD6nfbnvPchDzuQrkm4gWU3u4ExabfJ65fIMMsHNlTmfr89v5j
         V1TBxQbTI5QTeU+q2CR4gcw3iC6GOOKecFUUTfIwbzc/DTe7UKJLB9uQkWZ+PBxj846z
         TkPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184838; x=1785789638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ELjPly7GR36YIzSkxqnCCbI/tjI0YA2AC2jjG4KaPeQ=;
        b=OgVmIBgr2QLMnxLbG5lCKmKCPU8xXnXlgdMIHgMN/nbDQk86Naolr0qZR3tke5D26H
         6f1ObRPqIeTJ8hOQdteB8gU1Q3AVFkLtD1bXeHWV/sll/bFN7RIs5H4mlkfZjoAHXnG9
         +l+1Xo4+KVuJ8h2bz+IMJtYvM0MRQPqH+jJcBNxIkWnb8yx8HU0N+9ZYE69Hlpu/BL0V
         G04a1pI25n3esSP+OGbAPodLCGPxqtvZoPoJHAy1O7d6v4vfMOJ30mBnIMhhhrjUTFJR
         Wvn5uMshh0KCSLZU1HixagiAeB8GJFfKdcf9+6Gr83iLyui+/OGHAJxHFxcf3j9NjbG/
         kc3A==
X-Forwarded-Encrypted: i=1; AHgh+RrufTwgjUft+/c7PsbpoDMiFNEJOra7ja8RZxSfj7MocL5JL5FmEOo1Jaiqgg8PvhtiM2p/YYQZTcE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ56unGr+OcKgkDMSSL60mzj2a0px3rw4aWurrzuLPcrJfXcYA
	fxzNjNSsd/5JcERTbj5z3bkDyOVO/htT/Awpgk6hnRrr/VAjcMrPSSL9
X-Gm-Gg: AR+sD11SARtoNRNXZIeqXfq6jZHux+KXut5eJaE45KXcXGf+nYiY4HxzkqWjDXNLrVm
	+OIAwknDWT93l3HegtB0+G6fVQvylvZWeJXYqSpMIPh8l/joz2AKBT5mzUp8ChP/6CHg4eJcF+J
	qnsSp+lGv1sVyKzFf5vkH1FBVf6AtnB7rjTQlZ98D4zeaccC0tN6C4la1081wiD70f5O1wV3HMN
	V2JSUCrI3aGKr+2YBpX6zygze2X3Z2j+muaQ1xC7AJroSsey++9xSnbXdYwn/9good4vXmQ45Tk
	974qgiTDEXd37CmLwMafU2yf2ejcHi8rWHt1JqCrOiiBuqCPVaDboK6yoY7fSGAuQaRJ3+BL2YP
	AzXD+yoBkCcISXGksPVzRBcvauEcAdDVEqRXFOebqXsm4Nc6Y2dx1gCGU0sRPqWN4hN3xJowHAY
	dfJeLJiiOsUyaDRiA=
X-Received: by 2002:a05:6a00:c85:b0:845:da74:5d7c with SMTP id d2e1a72fcca58-84e8cfa9197mr901724b3a.32.1785184838288;
        Mon, 27 Jul 2026 13:40:38 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e533d1351sm3583338b3a.39.2026.07.27.13.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:40:37 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-actions@lists.infradead.org
Subject: [PATCH v2 48/64] dmaengine: owl-dma: kill vchan BH on teardown
Date: Mon, 27 Jul 2026 13:39:10 -0700
Message-ID: <36654fac68081c725fc25c3cce5db571567d6985.1785183549.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com> <cover.1785183549.git.allen.lkml@gmail.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use dma_chan_kill_bh() for virt-dma cleanup.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/owl-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/owl-dma.c b/drivers/dma/owl-dma.c
index 7c80572fc71d..5f2140dc01ce 100644
--- a/drivers/dma/owl-dma.c
+++ b/drivers/dma/owl-dma.c
@@ -1055,7 +1055,7 @@ static inline void owl_dma_free(struct owl_dma *od)
 	list_for_each_entry_safe(vchan,
 				 next, &od->dma.channels, vc.chan.device_node) {
 		list_del(&vchan->vc.chan.device_node);
-		tasklet_kill(&vchan->vc.task);
+		dma_chan_kill_bh(&vchan->vc.chan);
 	}
 }
 
-- 
2.43.0

