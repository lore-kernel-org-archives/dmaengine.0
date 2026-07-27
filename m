Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A7342B329
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 20:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785184818; cv=none; b=A2Sdca9r0l4Qf7Ct67+bUhlpLtd9BG10ub6wI7XGalMkq0Q6jZmeDbRcgCT5zTbXi5WHWpIbNUoykMWoof4MPOT8Q9iQy0BKpIR0XAK6xIi8iPCS3V++wf236E2gdHRZTZhgygX/MRMMUKWR8qxhLApw7To8TrUcFtCt/QtJ3QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785184818; c=relaxed/simple;
	bh=0iOIuI0jN/mYNOqyRk/TFA8My1zStcMUiTHcSXmblYs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AwQgxBC7hEVl4sdFYG81yAIHMk25EySxYw35mvXqYB+F/gmmOB+okSNiq2hxY0PLXGieyVQiscYNkGzuJ8f9f0NRGd4+RG1lEVzi77aQpnm+r20GwqsnClSGa0+cguwxsMkNoay0+VsbRDoVehD4K8WQTjAH3V0wprsKrfh8la4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W4//5y1r; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W4//5y1r"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-84e507b079dso1816408b3a.0
        for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 13:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184816; x=1785789616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=27Q4hCaQitmIJ0hKlEwnq1s9FoNMLH8SKrdxmCGUUys=;
        b=W4//5y1rpm5wV4t/2XCAJSfz5OOy6XFhqvWG/bBlAJpYsFaUeJC3bCkHDuR+eWgN/Y
         Nn5jVjZyTIweY+dgN5XK45Pc/4zGT1KRrv1ScpVMEz4Pin6twMPfJOFZWtfQb82VjeuN
         QARyB/lkK/lHDzmC+N/YN/yq2CTzwgTte4JFOqAzWCH+1w+gbIIxyuCawxpp6MHwFfyx
         fPsGEVVFOZm81JOT+MSsK41qdK8qAyO/29LosTdGD9dziUKIEPAl6YWn2wMMIS4aAQ5p
         lRvDl/TFvzaGq2ddzBd+/I2euQe3smOvGmxVBCMBNKa9iZWrH195kC72FDnHKLYypsrb
         shgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184816; x=1785789616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=27Q4hCaQitmIJ0hKlEwnq1s9FoNMLH8SKrdxmCGUUys=;
        b=WcWp0gQmwYPZsX0uEgqRezDhtFxR4wct/9KyKYmy6RKQftPMaJup1rtgz9WiAbas1G
         /+GWUhjM7+X2M4fGvRJP5OWihxAKTyWMtRrl7Wrmf+QPnVAUROrv7OSGs0dF6TWXNVg1
         rV+Hi/wiCxT6Tx3OTbtVFnez94hmBC14qYwTYhXRMtlcYPRtqkgnvf3APfLUBPb6pRCG
         uehlzSbIpE57P8TG5Wn66dLyvKn2gleA+Z5Lv8FIxSlh/rTx4md6Uy9DX2TA8jQbZKRl
         o2yePQpul+ZUZfeAywRm/GlobvwUk4/ENIOwwnG8QTmXuSZ6bBJmdZapvDbO/6G69kY9
         +gFg==
X-Forwarded-Encrypted: i=1; AHgh+Roz2NHdGK5CWd+DcXmxTGZd4DTCFUPmvJ3y/CEq0wFBJFw1uBHI0LhVjjbNHMCfwrjuHFhwxPy8lGE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxG4IWqmwO1MQKBVVnPKgfvh05Xxl4ADQIdb/LUw8iC8aITtgfk
	zhJ4wnKgdg5C+vgigVeH3k6gzcqSsDwvogcsHrL2ZCXAlIbyqE5cFtIKuG/EbA==
X-Gm-Gg: AR+sD115Qjj3e0hApFXqHznGRCSqRzrcvAtltNfts1+7TuQLUTInDlYZdSbUqhQLKjR
	efqsgk/CBPFqIIBTQaoHnkfkOF91YWG+mlpD2jeuNyUsLO13wvh0oxhEznZENwSFRZpFh25Owum
	6hpGSBud+5SdGpgWFSBRAsicbTFbqUqYRTU7b5t/Mf6BOLelr/DtaSsvZecIBYyX3lMTm9JQ/IG
	PXOJrh/rh6H2KGCaQzDcjiki7nYVvfef9tcfC8AjixA8lNTabCuG0WxacsWOxjBvHbZvQxwwC+n
	XxoBKcroYXub44H/vl9TWFz3XXYe7XIDNKeYOdhGv75rHMj2fk7jht7ltJUihJKOUibDhhK08nx
	IKLjvhzLGfSQFKsDHbsynmobOvgDMMOZi5Q2/t5Kg2M8fwbjeDD+56N+vgY8NVZIdf8UljsNj6F
	3ixT1sAhUOAFg837xdk3bkDUCEIOBq8Tr29ZzSyk9ky0vUR3ejt/E1tsWWxe5Ben0=
X-Received: by 2002:a05:6a00:9295:b0:848:2f74:d8cf with SMTP id d2e1a72fcca58-84e59597fc1mr8044313b3a.64.1785184816159;
        Mon, 27 Jul 2026 13:40:16 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e533d1351sm3583338b3a.39.2026.07.27.13.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:40:15 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Andy Shevchenko <andy@kernel.org>
Subject: [PATCH v2 41/64] dmaengine: hsu: kill vchan BH on teardown
Date: Mon, 27 Jul 2026 13:39:03 -0700
Message-ID: <5fb51b38a020076248ec76bf643825ea9ca81b8a.1785183549.git.allen.lkml@gmail.com>
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
 drivers/dma/hsu/hsu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/hsu/hsu.c b/drivers/dma/hsu/hsu.c
index f62d60d7bc6b..1a7f9df735a4 100644
--- a/drivers/dma/hsu/hsu.c
+++ b/drivers/dma/hsu/hsu.c
@@ -500,7 +500,7 @@ int hsu_dma_remove(struct hsu_dma_chip *chip)
 	for (i = 0; i < hsu->nr_channels; i++) {
 		struct hsu_dma_chan *hsuc = &hsu->chan[i];
 
-		tasklet_kill(&hsuc->vchan.task);
+		dma_chan_kill_bh(&hsuc->vchan.chan);
 	}
 
 	return 0;
-- 
2.43.0

