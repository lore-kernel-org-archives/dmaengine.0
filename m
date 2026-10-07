Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A09A451984
	for <dmaengine@vger.kernel.org>; Wed,  7 Oct 2026 11:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791373276; cv=none; b=BQi4gAJnCP/3p0E+PAGy+Rfir9sfohjfLGMhn0YWVktHjTShbM4SmENARJG5XGN5+gfehF5wYH1h/X56cYSltJ8TfFLtQ4aCin0Lr0w1FWBrtdj32PJ0pP5Kyhd5OQGSP+TML673EQEh5Zic0jSCr2QhggOS+ecDaYgzjEvQvqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791373276; c=relaxed/simple;
	bh=HrHOxl8vU4NtC3eVjUlc4i27OUvjn5hRvuvP9BpLLW8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QomUtJ9b+7x6NyHzpeFT5wAfR5SqbEoaFuYHkWcXVPjqx0A8lPITXUV0g3GjHDtGVE+jADlRNhoVBfd1NX+QOU90X83/1v8+hoKBBtoW+wIVtuOE/bf2NUWIsoeY7yOZQ2x836DI2eOX9XI6c0/KZl8VZLNBI0H31bYfNqUcc+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AKxsODvu; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AKxsODvu"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3a4b9732d5aso1685313a91.3
        for <dmaengine@vger.kernel.org>; Wed, 07 Oct 2026 04:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791373247; x=1791978047; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1S+23ZtOjWwrYVTwNmNORRFxt1wYzNyVlF7uFakN9wo=;
        b=AKxsODvuOCo7ST92k4/L8taWX/E1wKOTTRb6x0ZB2HOUxt522M9TVesw4/Qzz0s8Nm
         dASR1xMiOGb49376DEEs8Ot9LkRYUDKnLZ53vj2nQvLFEm7AHQCREyTTaQDM9Uel9mJu
         8lC1l97sHDtn8LBtN+nqpvywHMOOIYOxkAgv4zIgkXnHOPWXzkSBpp76z3OevDpLLw8l
         2chpgwxN56yiTX5/8YhwivEogDteeRZvHeJzfK7QQwBQJXRCHyP7mWgBXWJA+/0LyNIC
         hLk6ti1SR385ghDQu6jyTfO1O/0YaKwNcKXyV716MfHnZABTubxB+n+8pIe/Nt52bZTG
         O61g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791373247; x=1791978047;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1S+23ZtOjWwrYVTwNmNORRFxt1wYzNyVlF7uFakN9wo=;
        b=lMlBexHJ0pcd5R30xye6RPQYVxG10wbXOoOnUkUlgzLzyxskrE9zF50zwfjbq8/Pc2
         K+hZEyFIomUc6K0tXmUTd2Gcp71DwueQwn1DstqGJgxlxz5Bgx+z2dDLQyNJ7MxWIwO2
         GUmNoiwjRO3eaX6ZDnKQ39saFvlAp+DmK+xdGXna4BRanPQ1Uxl9OfB35UCK1XIvz+7Q
         bvJPdwXYC7F2eDoB6UR9XJ8Ne/5DnT5eT8tZgnUJ/++lvIL4hV+ufaXFBRLIq1d4sFaj
         Bc7FULGykBokm7QMIfdJEGEcqEeKJ7c0EJ6Satosh9RB0NF6f7y9MJiLTiiE7b8855Vk
         T+XQ==
X-Forwarded-Encrypted: i=1; AKwUvByi6LTxZIxiR4hgxQLuf3bZEHkUjVSVbFjhGyMdZvHNwR+6DZPHuVZEkDEA2Lv6E16P3nC+KnADHoc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKjMgfZokiPqYdSfK1SisRFM2+f4txnNV1LrHDbLtYGasNePT5H
	KEejj0ppwHg5GYA93hBDpZU13DKfEEwnMKmkZfMUFqF83rgZY5Si+G+Z
X-Gm-Gg: AYBFou1XYhsYM3IJkI8QMrYglQ3jPbiwbzscXF1Rxo2sdgXdVpP2fK13XkLpujPnvFl
	L7CMdZ70JzEN4oL4rd2CLRTu/2ChbA2dCagvyUk9k9PNvojhJlI1GulBuT2EoP1K5u6pC8zmz9b
	1cXO8vRHuxEyl6NXLEZu+IJSLoEh1JsWXHYP1ffclso4S5TJ9thJvUzLFBl3qkw0e6xUpzwV+/4
	XCZ/OiSC503CKhaEtC5LNqZhGl5Z6aZPwC4lCmUXx+D1DxCdh1yAfOeKCD27ptJXPNhJTcJAikb
	ZkZjEf1gtcLVld7S1dTPxpJd5y53CwGbCAmjlFtOTOqshcvhFxE1mTcbfS/R6+N+cY+/idhk431
	SMFko/Xiexs2J9gisGPrAUi8l90ams5vW8IR6KPHmCj8JMcUGDQZ1x4OCP/8EJRsllaL65k41I/
	ctmxd8zRPLf/AOGWmzHchiaz/MTFBnZ/gBvrUyTWwrgV/B2BDiaOBPpw==
X-Received: by 2002:a17:90b:384d:b0:39e:6c68:c787 with SMTP id 98e67ed59e1d1-3a8a1553dedmr1695567a91.61.1791373246732;
        Wed, 07 Oct 2026 04:40:46 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1000::8534])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a89b5c5d9asm4127072a91.11.2026.10.07.04.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 04:40:46 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Sinan Kaya <okaya@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] dmaengine: qcom: hidma_mgmt: fix autosuspend cleanup on probe failure
Date: Wed,  7 Oct 2026 19:38:36 +0800
Message-ID: <20261007113836.115774-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hidma_mgmt_probe() calls pm_runtime_use_autosuspend() during probe, but
the probe failure path does not call the matching
pm_runtime_dont_use_autosuspend() before disabling runtime PM.

Add the missing pm_runtime_dont_use_autosuspend() call to the probe
failure path before pm_runtime_disable() so that the autosuspend
setting is properly undone during cleanup.

This issue was found by manual code inspection.

Fixes: 7f8f209fd6e0 ("dmaengine: add Qualcomm Technologies HIDMA management driver")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/dma/qcom/hidma_mgmt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/qcom/hidma_mgmt.c b/drivers/dma/qcom/hidma_mgmt.c
index 4805ce390ffa..d8c56af5882d 100644
--- a/drivers/dma/qcom/hidma_mgmt.c
+++ b/drivers/dma/qcom/hidma_mgmt.c
@@ -310,6 +310,7 @@ static int hidma_mgmt_probe(struct platform_device *pdev)
 	return 0;
 out:
 	pm_runtime_put_sync_suspend(&pdev->dev);
+	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 	return rc;
 }
-- 
2.43.0

