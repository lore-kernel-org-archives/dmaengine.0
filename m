Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2F7406276
	for <dmaengine@vger.kernel.org>; Mon, 20 Jul 2026 12:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784549069; cv=none; b=NkiZvmX4avv06jxcoTKienuf7fUMQJLYBBpwx+I6rHWLt0WYseqhslZq+767yfckX1jbhDY0wTmxA6QHsbAnGJoIv/KZoXr9U49ujVRmMkYHt9pneeJBT0pnrMX0lh6QvXfzq13wnA9fqX4PTxGlwo5SSO2Q1cVSeIlEI7UYjlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784549069; c=relaxed/simple;
	bh=nPaxFFbrmeb+91WpqHwS+vk3UpkySmGHl0MqDq5lF5o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HO/J2HNIIE3ATLNuTemsD5fZnk5LE7iyk+5Xbw1s4BskNEBcGwRe5alx5i+Gn90PRJOgQ7NUQ674RCi+EQe8wtV2f/9k3q/0fM8TWf4bsCZVm0WuGcMI+TWxu7icJ5q6JjjlhGXb+kmh1rYnjGy7fpUJGSV1zQWLL8Nz5NxKQUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=LIRAa/ZM; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="LIRAa/ZM"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49548aebcd8so18738315e9.3
        for <dmaengine@vger.kernel.org>; Mon, 20 Jul 2026 05:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784549065; x=1785153865; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vbAz+prXUAHPCU6EIU7o9Tn0Uye2rOTRHZhG2pAbMPQ=;
        b=LIRAa/ZMEmzFwtPQA+LagEYzrmPnIRbhSClGn8XWnxOmMCm8V1755SUoSXdIcI8wU+
         KU7dmou6q9REVXq9Ae5QtnGQ7e3mYOqwO2nBToxlGZhPDkOYyBpQaiHa47AKYFo4fa1P
         /thQxDGj8/ooipjpsg+fVmRLti/Ut3RMAhFjKU8c0Zse3Bx7I4SLpfZucQ+g6IJg91zl
         D+Gbh7C/9rU5a4YAToUaDf6RWVnCYjXosXe/v7G20xVB7QuE8vlPXAGinVTGr56/kdpQ
         sA3bylYRHhWOSHOoRqY7RGau3znxdFOow0NNtZ+LqRgJFnq0E8hPz5a3yxQhV9ErIRqs
         fNGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784549065; x=1785153865;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vbAz+prXUAHPCU6EIU7o9Tn0Uye2rOTRHZhG2pAbMPQ=;
        b=SCFQXIh2dq7Eqg1Aa1MQbqXhr6dMybUoIyaEoazUQnrBhlRPPKgHySmV8/zvD9CxS3
         ZdrimpxRdpH72s6sZUV30MEo2ox3h0d8Rtx0V4EZUYOa3DbwEi/PawakF+ZWoiwiz57M
         GdM9zrKTsr92IhET5+8dZ/Sc3uedrPAZUAxJiEoRiDzqQJAEXyXzIw8XYxTGJlFTu5sS
         KDL4qKusYZmm/PT1DS1YMowRBtx8WMsbc+Ggqqe4iSMwnziszsM0sgSd61JVzKsx5w2M
         zZ6OXQYdT0WglDj2CDux0TIGNOnyPJEQQisxOZLUhHnADecd/Tgd5duJfsbWxJbD5sEi
         b1TQ==
X-Forwarded-Encrypted: i=1; AHgh+RppmBAXOW+TqZ9Qs3fnoRn3+FR5XSNPkVlXD9VDyXG3ou/yO38xdJAai69RTRQberQQLS61jFSNOKk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoZCkoXlzbry14c0Ek+W4Ks2MUXlW49KJFyiBews9X5+383npL
	JUTTtQ1zTTq/fX1UWWq6be9kO7DmJHTenImI5D/djWLoAPiK1rwSK162Hg9/UBiLBLQ=
X-Gm-Gg: AfdE7cnEQ5NoY+NPCZYlDc9bDg5lv0K/Fh7OiWVh6zdcDP+ik0C0HIIs9C2Kwpht7RS
	+fqJtiWJ3qZzC8/gilKUbxM9xjKH1Eb29C8e1ueRYcASX6g1gOhfSVlQZh5eQExbmxIY0Ysu82P
	Ju7lMUdSdkf/DHhmlmzquQefQQaFIXVC7GRK37P1CcOMUM16733vXrQu0Q5t1jD7GEmdLcM+S2V
	8/Qw6LGRZEcXVfRavp1D6Yf6CvgumnxQa0KWrXlZNeBZJlAONi6CbqaphLelNkoysMB6F5+9CpA
	djL6GFovash2KvUCJP/J/lC/5PBN2c1D11qL/XRiWr4KKwAvmNmimE0BzHQjD7ofo0K3etqPHHv
	XBkMCkoNge+EvKSUSMRMwvY4zuhuXYDJUZWpmbW31P2jamEMNPfiWu8UjDv+Dsz+Hj6wZhSWFHw
	xWL1R2RlqNPMXGZnIxraPGetLnZ1AJGwbdzn+NqG2IinZUqPJoLRu6/ByTzrHeA+mlFg==
X-Received: by 2002:a05:600c:1c04:b0:492:3e69:a86f with SMTP id 5b1f17b1804b1-4954a3cff64mr166970435e9.1.1784549065121;
        Mon, 20 Jul 2026 05:04:25 -0700 (PDT)
Received: from localhost (p200300f65f47db048587886ecb5b26b2.dip0.t-ipconnect.de. [2003:f6:5f47:db04:8587:886e:cb5b:26b2])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4955fc42db7sm57454745e9.3.2026.07.20.05.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 05:04:24 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH v3 1/2] dmaengine: hsu: Drop unused pci driver data
Date: Mon, 20 Jul 2026 14:03:48 +0200
Message-ID:  <800279817cb9408259bfbb661b40c87ec9302b08.1784547700.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
In-Reply-To: <cover.1784547700.git.u.kleine-koenig@baylibre.com>
References: <cover.1784547700.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1245; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=nPaxFFbrmeb+91WpqHwS+vk3UpkySmGHl0MqDq5lF5o=; b=owGbwMvMwMXY3/A7olbonx/jabUkhqw4vlV36r84GHNGpiWsUF//L1VtpeQ+04w/XyZwv5FIm VdlwibZyWjMwsDIxSArpshi37gm06pKLrJz7b/LMINYmUCmMHBxCsBEMr6x/8+OZ6mbJ1jVUL/k 1ZYT+c9vSE+axMgsqdp1rKDy3sYDfNXPsgo70iRn81/m2LWjNp/hb/x7Kf+TYsLX/rCmKxjsk3o d+jer+lTl98mKXL/seppub14suZBTSFNvjlRlnuraB51LFs1j+XDs3kfDmtzkZ/LevP3uGl1vdY W+L2Xijy1fe9s9VdF3raDw/Mk23+p6w+Osjn7d51xYlHA87rjQD7a7Z34vv/60z/e+6U3NsAP/h LqLJuXZ3k76FPXlHMvWLNmbHUwlZ1PUFijqrX0ZprFXS9z4e/ap8klab+v1pCdxZqTtlflzSvsh 8wHm4GN59g2nfVs82+yTluw24V9huvFFldPMFU2cN01TAQ==
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The driver explicitly sets the .driver_data member of struct
pci_device_id to zero without relying on that value. Drop these unused
assignments.

This patch doesn't modify the compiled array, only its representation in
source form benefits. The former was confirmed with builds on x86 and
arm64.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/dma/hsu/pci.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/hsu/pci.c b/drivers/dma/hsu/pci.c
index 0fcc0c0c22fc..b42c9c0887a8 100644
--- a/drivers/dma/hsu/pci.c
+++ b/drivers/dma/hsu/pci.c
@@ -116,8 +116,8 @@ static int hsu_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 }
 
 static const struct pci_device_id hsu_pci_id_table[] = {
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_MFLD_HSU_DMA), 0 },
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_MRFLD_HSU_DMA), 0 },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_MFLD_HSU_DMA) },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_MRFLD_HSU_DMA) },
 	{ }
 };
 MODULE_DEVICE_TABLE(pci, hsu_pci_id_table);
-- 
2.55.0.11.g153666a7d9bb

