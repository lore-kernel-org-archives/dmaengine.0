Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434943D331E
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 20:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785184809; cv=none; b=SnCGZYR0yuFKD/jyORMa6nJU4hror5/8dpJtmOQ0Oz5CMsfZq87FuZ3/OEscGm00FZUTd8vDlR2eqGBY3zgrNV2cxnsdVtCkWpd0Kl6dMVmeHsJqISO6gHXdzBJQtAEpvI8iqmuHJH1eIHb25LNiiUVKGic7BdwEVPg7oOdUH70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785184809; c=relaxed/simple;
	bh=3I+IneMREYt88BaVYoRjqtlCdAbbhGaPFVouQ/nhD/M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KJBqzsoHXm1uWCMbrkepTBuaciD8Q8rsbEKyZZ2mTcQMOFlXTeVTYbf6NVzaw2aJsgwyzuadD94AC+PLvd+D1S69/eLO/eoASmqFwcWePNSrVovmgsmE6NrHF2NRwAA4LKYtuWAjyn4vtDFw9EwX+p5ZEKftsTBHgGSTufX362Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NM6qMVxI; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NM6qMVxI"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8486ac3f347so294086b3a.1
        for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 13:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184807; x=1785789607; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4ixGC9WXfWKVTCbnCPoce8RcjDRyrluNNKAlcb5E2Jk=;
        b=NM6qMVxICzMRxbD0w/Ecv5+PiSXA+3PO8ykJTclsnZKjIDiuqdPDVYAW8g6rN5LxQQ
         VFLyWxfjgarT6KWyFRXV+LgS0pnfaFgbD4yU1rnjU69gMqkb+xPWWvBn5Vugqu9c2rH7
         cIgrw3QuNLVf3/AkGYsxCXKnDZL9L7N0keoV/99XcnrinJUyhQg51jpjNsri/d+oUM6n
         Ct3FKifV2hyzENJr1/WxIExnVIBBvVdQwNmaoJNdFLcFUvSOMbCvscUfEQvDwkG1POdc
         camhhF4xTnqMJ8fBz8P1FciEkMSH5CtButSqgo6mR+lNetEqtawiXAXLfWpYq6CIuha7
         bHUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184807; x=1785789607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4ixGC9WXfWKVTCbnCPoce8RcjDRyrluNNKAlcb5E2Jk=;
        b=GaMNxomjx/9IOWUhi50B/INGNaaL7QbNuDUHnckNuiaUxOvswUQmQmpHzrXLmF3I4r
         zPVOtBeDEx8oEnTvBD7mg9knpBccjHhjq+xOyrUbbQo9/F87c0hE1VF841steHZcBUaS
         fDq47CglknmZLsybFxonw3PaJfStmOwMZzIictgnRm3ubFvvK8J04bWYGBnV6/i7fpIM
         xavEb3baiIDdXez882CenMiLImh0Va5ae2vtVlYhaad3KPWnJZAZKmHZ4/J+hw42/Zws
         +u+u139lNIUCaINShagAZQVJqm1xhU2WTFyrHQb+VTAwud/qJCBjljtXm0b7ml0PvwCv
         BhHw==
X-Forwarded-Encrypted: i=1; AHgh+RqSgYh7R4iNejIA9SQs6Bs1lVZRsJNhW3W/P6nqIY8E3AIF0q2BgBNI/i0rI1gVMKYtl2iBKaaIxEc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmtyfYPH1/vsO0wwLJqdyYpEbTq/aD2LPK9vXDdYQESY0UEcYC
	mcVh51T2wp1HsTfkV51vurFUB0vC4pxMrmygLLy/ahG7MC7HJAEFmClX
X-Gm-Gg: AR+sD104g4kiY3Yt/kUIdvK3eAJTd3vXFzW4JdBab9R6RpaAUNSRnSDTna678TKp3kv
	g42Inwdi9kTxR27Qkvgv2gxUW3HXUi873TEnWlz093ah6wjTOsrkiKgrogB1cyDAfhOUlKnPkhh
	QL6sjMsSrcixOzh3dilmHfvSBNmYJ3vFVM+CfYhW96wJVLMY/jnYlC/CL1JFGaV2NRYSwuh2+cL
	FR9MAP1jrXhOn0YjVu+rrJ32EgM+NVyyVpQVj/hBrpfl44JtjJKFAYHMFx/o0WIVP190yW8jI5p
	aGnqI5NH78xBTUUt7C8DB1PPImhPvKB4YLtiq9rP9C3woAhca5mdqBx9+/SPjES5GiHT5AkrdU+
	jymskDl1iFjrbqH2cp3Dy1z0Y6nKmqqsePV1QDyBMhx8C8apeZNYalpHDoxODY/9reNxJSCRVvX
	Zr24BE
X-Received: by 2002:a05:6a00:a0e:b0:829:b08f:7353 with SMTP id d2e1a72fcca58-84e8fbd42c9mr205344b3a.7.1785184807604;
        Mon, 27 Jul 2026 13:40:07 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e533d1351sm3583338b3a.39.2026.07.27.13.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:40:07 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>
Subject: [PATCH v2 38/64] dmaengine: img-mdc-dma: kill vchan BH on teardown
Date: Mon, 27 Jul 2026 13:39:00 -0700
Message-ID: <333e90fe6e8df85aec14d6b4c9ebe9da7040d122.1785183549.git.allen.lkml@gmail.com>
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
 drivers/dma/img-mdc-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/img-mdc-dma.c b/drivers/dma/img-mdc-dma.c
index b3765ba15803..374034c737c0 100644
--- a/drivers/dma/img-mdc-dma.c
+++ b/drivers/dma/img-mdc-dma.c
@@ -1031,7 +1031,7 @@ static void mdc_dma_remove(struct platform_device *pdev)
 
 		devm_free_irq(&pdev->dev, mchan->irq, mchan);
 
-		tasklet_kill(&mchan->vc.task);
+		dma_chan_kill_bh(&mchan->vc.chan);
 	}
 
 	pm_runtime_disable(&pdev->dev);
-- 
2.43.0

