Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A239E4334B1
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 20:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785184842; cv=none; b=UHr3xz6Cd5Il+TdykBjdHW9KdYHvZMwNSEU3b5QS1BYh6/Kg9y+teyZsOb8nuJ+7/aiSY7jcZRFaI7w0sTyRCy3Z7GybZw0FavNmB1J6wFQKOS3udDiDTf3rl9akc+TVRhYW70yga9NuAkWhNYnme/50/yfr4IqkPDHcbD0oZuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785184842; c=relaxed/simple;
	bh=8B6MqkXayCVg70cFeQ4K5TBJlt0mnqZFWTubvBw78u8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xy7ssKimzluylrIMMp+WdBN16mYxqn0cEivBCnJ5VBeY1VdQVh1U4SqiUmbXoIjGKPoYDzO/7jJCuAWbbrZ568ss1EYhoRGChTY81etFVEjiBmoUfO2G4bjfZFzckPA6HZamJzglegBngMOjdkBdLoN9XMtf4xtd9j/1T56Tg3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dtUdvXbJ; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dtUdvXbJ"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-84e507b079dso1816735b3a.0
        for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 13:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184841; x=1785789641; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qk+05lAXu2oakYxdB9WfA0pvFbgKeIMJzrTjIiQgTsA=;
        b=dtUdvXbJ1Ber9W9WJF3U8QIxmBZu0AYfB4crUg25jwlxaQcc+kbOXaEt4f7k3+YrhK
         eYGaRtddS/2Mf4DvoGq5Jg4qk4KBuAPrEBYTRzLkOimwK1VWuwf/qkUYG1PoVSTdWfH6
         Hz0E5mCjo5hHr2sGojZlYkiJm0/2Pxjd77skQfxtLwq9rQvbecaGcp4IUsqzOkGOZdC7
         2EZYZisEmphqcg9phgl2fESeVqqGek0AO4adXddFXRw6ubhPh7w5zEPsplSK4k1bKMCU
         T4S/WdYWrK+jmCcLZxMfwdYAC101jiqMQEcbuaxE1sXkKupIrFVACOxQOTgl44X7kz6z
         NYJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184841; x=1785789641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qk+05lAXu2oakYxdB9WfA0pvFbgKeIMJzrTjIiQgTsA=;
        b=H9Y5pt7xnX68lXOv0zSQOQ9cqzScf103wU/rv9mnzO2uTrVjjq76c99PONdzfxTKJH
         YrByymD3KJMttbcXCjI4zh0juCDkexsLUYjaObegA1+I62DKamfgEheoTk0zgatFBo/Q
         bvRP4F66fxlXPhq32sZpSUNka3vck/A/5yfjZ/ZzlKCliMQfAsZlVuSa/n5siwODEK65
         3UYF/kPkcLxX4spXu7aEPLxJzQCOQ7MD73ONHyM597IUD8YbEBawvY8XoOxmj4L8juTC
         TCzqoEDlsA6T1gGgXP51OHlv8Ht9pM7tLGrdEy+r3gol8LOPpjSnIqbaUfuOsnxKoUm5
         /1yw==
X-Forwarded-Encrypted: i=1; AHgh+RqcT99eozOaOcTWz8TE80w0PcFwSa6HeXBzGBEXWSWJMV37zpkv6Vyn+GDrzGkz0uYV38SxQOvCnkY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0sznqx0NccriqHXF01YMF+MTBpEhytdGvgiixBln2rfbRhE7I
	mdrvzu7AfT5da36xwGX1LLOb/eTVlAGSX3ksp2q9mqX2aYeCH/APsdz8
X-Gm-Gg: AR+sD11C2c8I7Z6Nyt+dX+1Xqqte/spIpmofX776jCLmKOd1VEnRopfSCsKg7zk2f5N
	JDoB6yzj273MUMo6ZT/jVWtlJj0vcX2mHCgiazuK3SzVS6rkdlxT0BkyazHIA2vznHMNCob3Fcd
	GFzhR2pru5gJNHGm5atvR0h1CrB3O79JlkKc+UfTBrGVu1jLrwQlXCc7PtRNcLFT0g91N77Dif9
	wPn6V5XFUikqe8p9vBZw047TmZKt10/fiMfu+kEjz07dhJBOClFskALG5bdETB7x9E0eVkAU4H6
	HnSesd9DYkrz+JmITkF1hWa9N3R9PUydIUhF8Uh9vO4U1UKCnopVj52NaWIw1nsHOqZrzLxljrI
	Dhlnixhw+geyXPKe3vdw8nsIYo/UJrWSjQ5cwDzS+EFYY3i3MDngOhI207CgBDv3INFike5+//W
	T0f+a8
X-Received: by 2002:a05:6a00:b93:b0:848:6537:580b with SMTP id d2e1a72fcca58-84e59591bd4mr7787273b3a.51.1785184841069;
        Mon, 27 Jul 2026 13:40:41 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e533d1351sm3583338b3a.39.2026.07.27.13.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:40:40 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Zhou Wang <wangzhou1@hisilicon.com>,
	Longfang Liu <liulongfang@huawei.com>
Subject: [PATCH v2 49/64] dmaengine: hisi: kill vchan BH on teardown
Date: Mon, 27 Jul 2026 13:39:11 -0700
Message-ID: <9035b2331349a57b145796c56920ebbd7c0737ef.1785183549.git.allen.lkml@gmail.com>
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
 drivers/dma/hisi_dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/hisi_dma.c b/drivers/dma/hisi_dma.c
index 28bf818f9aa6..39bc88c46513 100644
--- a/drivers/dma/hisi_dma.c
+++ b/drivers/dma/hisi_dma.c
@@ -720,7 +720,7 @@ static void hisi_dma_disable_qps(struct hisi_dma_dev *hdma_dev)
 
 	for (i = 0; i < hdma_dev->chan_num; i++) {
 		hisi_dma_disable_qp(hdma_dev, i);
-		tasklet_kill(&hdma_dev->chan[i].vc.task);
+		dma_chan_kill_bh(&hdma_dev->chan[i].vc.chan);
 	}
 }
 
-- 
2.43.0

