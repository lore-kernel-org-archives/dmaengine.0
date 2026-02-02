Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97F7263F5E
	for <dmaengine@vger.kernel.org>; Mon,  2 Feb 2026 03:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770003881; cv=none; b=KLd0MuDRX4S4SpF0Nf2DrdIU+WuZWcWjvdT1MHhMo/FJ8klUey5z0ViB0kGloiDf+0o6zRzUD89vJZ94EJut5c3rC8etzJCRBIGN3t/ZqnIhQxgZUE5AFGrYsvFzMSL9eXHTXzBM+x/Ug34VBFFk5OFtJhLRmSV3LP+Cqie9BLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770003881; c=relaxed/simple;
	bh=F8zEL5bb/41FmEyXl0gxGgleFUTWqen0SuRI0+FGjd4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M//60YBBiupzANWZVL9A+kAEGEPJ5rkrp+m3AQg47NiaDiKZI3Lp7ctBrBMJmmeye77l/dJY7MlffbyFI0R87U1ud401gUoqiypOMFtB9oOr0ydG9cDAPYvCaWvg0JSAwDNDzCQdKEBbp/dPKRj2i5V7OarP+mWb/TvX/LaOb50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bs1PEME2; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bs1PEME2"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8c533228383so242360185a.3
        for <dmaengine@vger.kernel.org>; Sun, 01 Feb 2026 19:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770003878; x=1770608678; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0jgsCpDdp/lW2kw7mE1/acyw+xEa5OKHQFKlf7uWjA0=;
        b=bs1PEME2AizbENl6HrNtrfa3myRMC3Uwtb7bFwBybYxrc4YbjWzuonP0uxCQHCr63p
         7hUShdiKuKOptOF1Gpp1I8tSwQjaCfpZ64dYsjMbT5RfanF5IXwnnbPhzgaT95NB7e7i
         uQqlUBkiFY6bN+Diro83TAzQGXusWT9FMuSMxXqWMnjy4wj1nanE48g+JWbElsTfLIUq
         e/GJhyfsFJQXc4LOeWx21DuCVXDO0aAaJ3ik0u8iMqHcAxkB6DO+QVnl8wcyzEvVIX/U
         v3nTXfd141NnqnyDSmN7h6cpEyUsuA/nI8LVON5IjTApVuyXpMjh8wT6WLyT5JofYbew
         JDIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770003878; x=1770608678;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0jgsCpDdp/lW2kw7mE1/acyw+xEa5OKHQFKlf7uWjA0=;
        b=gaeeV8QOYKY9jEDERV9xnV10iBWPalhjTh6r3URQgd/vtV3MlH+XaJQh8eQblToX7v
         DzTQhgVxf0TB5tSAPnQMVHTj5+uQkfeE1q00mG7ok4GxHWKKROGlNVI8/a00Uu8/ObtO
         eqUjsoJ1AYEYNLt50AFEOqpdIRzHTxZskSKWABkXi8qxNARsGOQOt0Pe3fng5ZGn24Ry
         wUTrdIGF71AX4WlYDcz/VKPOWTPNAX1oYkXeUhwY1LILASVBcCETgOSFySVUtE2AWUg9
         66LOc1X/7YjOpT8dOtqKe6tfO783hsXxvXJt5h6YuZxP3+swGqySSV0A6gNfAbTZymDh
         bgQA==
X-Gm-Message-State: AOJu0YwyfgBNzDDnmo1mNvo3JydxdukcnyRLycTY5fsPju2fTWSp+Ox7
	nxAxOISADySmb78mfvzTTIpx67ArweIMd74eFUBfciXMFf+WVn7aKDyd09s3lg==
X-Gm-Gg: AZuq6aJW1E2IP9JTM2gdwlAqU9d+/VXKOds4D0+877VR9f9F2HRmDoovzTyq8307Bvz
	zp0WXLmrBp+IuCu54SZvd9ThPDUYX6VSP7G1W+Erobo0VKQHXFHpjObkIrj4sgBx2n+4G1KH3vd
	kXbCcDAVCjksraYqfH7g6u7wi4BQHq/TF4Tinl4wEMkl+SyUO5w42hW0d/9obqfLQGcdCl00+R3
	MD0hnIk/TGh08wRUcVeqWC/1e2drGRXj54KvQNwHvK0mi8MSgIAsGjR8oaW8hi+jMI2sqTex6O1
	1iAqOw/67tpBalWqTi1FeriMRCuG6/dKZ/vg5IXLIJsP2TFlGbV2TqOHaFfdZS+HKFmfOsdtjkf
	TzgAAAgtHA+mZUBevJUZzRQQ7wUVmdEyG3qTf81JRSWJBQSTXPTv12zxJTgYce9hvigkN
X-Received: by 2002:a05:620a:45a6:b0:8c6:a034:921f with SMTP id af79cd13be357-8c9eb223ce3mr1322859385a.17.1770003878523;
        Sun, 01 Feb 2026 19:44:38 -0800 (PST)
Received: from ryzen ([2601:644:8000:8e26::ea0])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c711d6365esm1159727985a.52.2026.02.01.19.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 19:44:37 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Laxman Dewangan <ldewangan@nvidia.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	Vinod Koul <vkoul@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTURE SUPPORT),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv3] dmaengine: tegra210-adma: use devm_platform_ioremap_resource
Date: Sun,  1 Feb 2026 19:44:19 -0800
Message-ID: <20260202034419.3958-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simpler to call the proper function.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 v3: reword title
 v2: reword commit message
 drivers/dma/tegra210-adma.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/tegra210-adma.c b/drivers/dma/tegra210-adma.c
index 215bfef37ec6..5353fbb3d995 100644
--- a/drivers/dma/tegra210-adma.c
+++ b/drivers/dma/tegra210-adma.c
@@ -1073,14 +1073,9 @@ static int tegra_adma_probe(struct platform_device *pdev)
 		}
 	} else {
 		/* If no 'page' property found, then reg DT binding would be legacy */
-		res_base = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-		if (res_base) {
-			tdma->base_addr = devm_ioremap_resource(&pdev->dev, res_base);
-			if (IS_ERR(tdma->base_addr))
-				return PTR_ERR(tdma->base_addr);
-		} else {
-			return -ENODEV;
-		}
+		tdma->base_addr = devm_platform_ioremap_resource(pdev, 0);
+		if (IS_ERR(tdma->base_addr))
+			return PTR_ERR(tdma->base_addr);

 		tdma->ch_base_addr = tdma->base_addr + cdata->ch_base_offset;
 	}
--
2.52.0

