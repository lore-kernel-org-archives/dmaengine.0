Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8EF386C37
	for <dmaengine@vger.kernel.org>; Thu, 16 Jul 2026 05:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784179692; cv=none; b=ETzF8JZ/h/Un1nMdKq5ZcD2/EkWGQQuu9fNftfFJ6XXm+S/JwYAyTlzkAn+qJSJ/PCfy3D51UjzdHyox5kQ95h87qPAJzmw3/Z/A7wfiYXcQkMUbwOsxDru/UWYxP8Um11H4tHGsIC7zL9BDX5JHFJ3pmyDdHvGj4AdzBZduNoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784179692; c=relaxed/simple;
	bh=35c5StQbuaFW5GuMnci6T+0xPvaX5c4d94nGNG0Dc7Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pCHvpCpPGnQ4wX66RM8n055ubXrEgmdB5yKcxG7xXjEP1RJ6xMPukaxM9akiREpxUW70/oVFqrFjZIKvHXkt2eUTHSGJPA/bJezkBEOXIqDsvFSzE/2wrx35+LR9oJrT62Nf8Q3oeNjWMqEDnDyZl+COUuctH3osSc+0cJmB9bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hYCNnp3c; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hYCNnp3c"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38dc69c74b8so4377774a91.0
        for <dmaengine@vger.kernel.org>; Wed, 15 Jul 2026 22:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784179691; x=1784784491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5VLkkwNkuanFo7iAvh8X15HBgCLDw1jqvI+OuX50DUc=;
        b=hYCNnp3cdEAv7+g4ZKt+qN7TRgb3s3TO1rLvfWylR1NquMLH2wAqDPeEm6MkbwKMqi
         K5XNXk2KA2Wfp+KNqXls+dE01jMD4vXuPDiiF+4FoJWIYOIXW4sUagIMOyzhfXlLAMiC
         AIH4jciCTFPYn40NHSoqiIdExbwkIc9XXxZeVfAuSGRQAU7JL5qRBmUQpMzPvQb9xvWw
         kRl//nQEL5wiHCoa4c01ADEF46Khu5cZrkcFKICq3HKVX8SY6jLO5Rov/D2c24sIeGhJ
         507gmYT/4onwd/HBeVxFYETWiC/+Jf9+v5cY683kSxvHIIIc9t4+7EaolUqgOtMfWpGa
         hNgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784179691; x=1784784491;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5VLkkwNkuanFo7iAvh8X15HBgCLDw1jqvI+OuX50DUc=;
        b=Uq8kxg6D5qaA6Jk4YNa53S05tr6ssJzqzIkBiVzd9LMXeBgMCl5A6XWDIL7eV8c1mr
         dfFVAb5OGWRtHpiJ4/eBwHIJ4b6hhGJZbwHbYTGfVIy4zgho2ZA4k9ub80F6afJc4JCI
         i++foUOO8qW/bBCSJNl9iPXdm67GbpaP3BILwJigEL1k/Kipi+zKEW+mYjm5BR4x+cs+
         EJE3MUl3MqwW++/OBN7+Goql/p1EPUxSCf5CNrKX1+ofyDVqB8Uxg4lDHA9SVJEvGJmH
         Xa7Beiw13J1FJUdh5jCKSwNxsOW0JM38rw/9TXUWwrf4PPfBbJ6Y9HrTOc9O8Q8lE67f
         Jdbw==
X-Forwarded-Encrypted: i=1; AHgh+RpLNTa92dp2GcTTmDN/9KAS0VZqR3MYUQP829CutQf19v3/Ow47vz1LVSe4VJ7FEQ21gNwSFiA18/M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEw1iKD1DZTzA1IZOKOBP2D4Chk6eUDm3Uirj6Jhm377rmaCes
	Ajv8BuUfP65QYQ2SyhJOGn57juq+2WIrnjhnVAVfy1WUq3xtaGQXuw6P
X-Gm-Gg: AfdE7clpVx4dZ+Nc3TnI/MX4vk5AH9ZIeDUdMwUGoFr8M7I9sKnv0C2cTW0vuAOntzL
	iGos26l9hedQDEkE6SD5l2iKuSJezqaxbq8JiAiOE4+8h4f1jntEa27sB90V+h0dyVBY63n0sPz
	tYqbyeKWov0UkrAbTYIkj2h7WWlNws4LytRyllZkDXKNgeJ11kPHzuWrQZ1SsSzmxmkbpBdfDMa
	YXC+qpO9CSkf8RNTtaszU9bLa5kpfKFUtq8dNxaQqDpGnj2KBCkvIMbEbAvWHo0T/Wi/WhoaR4u
	kPu5AboL0v4SrTOjaZgNiG2srwDPVsXMDAnpWePuVlxkBhGU2nyrUvzuUUlKdB0uxOxaaWf/DjO
	IEg19g9W8E5Xjw63/jMKaxxioVYQ/0sgc9SDQavZ5lFcRe6s98VgWj/yRxWa8ONP/oisFExSM+c
	ax5Gx/+CYb3uS4ImSFqRQyo9x4FqLoNoitXAnOB/McAiHdTYw=
X-Received: by 2002:a17:90b:57e5:b0:38d:e7b7:5125 with SMTP id 98e67ed59e1d1-38e2a030175mr4468410a91.17.1784179690909;
        Wed, 15 Jul 2026 22:28:10 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e39dee580sm670228a91.1.2026.07.15.22.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 22:28:10 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] dmaengine: validate dev and name in dma_request_chan()
Date: Thu, 16 Jul 2026 12:27:58 +0700
Message-ID: <20260716052758.23465-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

dma_request_chan() assumes both @dev and @name are valid, but neither is
checked before use.

dev is dereferenced immediately via dev_fwnode(), which accesses
dev->of_node or dev->fwnode without checking for NULL. Likewise, if name is
NULL and the OF/ACPI lookup does not succeed, the legacy filter-map path
eventually passes it to strcmp(), resulting in a NULL pointer dereference.

These are caller bugs rather than normal lookup failures, so add a
WARN_ON() at function entry to catch invalid arguments early during
development instead of crashing later.

No functional change for valid callers.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/dma/dmaengine.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/dmaengine.c b/drivers/dma/dmaengine.c
index 9049171df857..7b479cd93b9b 100644
--- a/drivers/dma/dmaengine.c
+++ b/drivers/dma/dmaengine.c
@@ -814,10 +814,15 @@ static const struct dma_slave_map *dma_filter_match(struct dma_device *device,
  */
 struct dma_chan *dma_request_chan(struct device *dev, const char *name)
 {
-	struct fwnode_handle *fwnode = dev_fwnode(dev);
+	struct fwnode_handle *fwnode;
 	struct dma_device *d, *_d;
 	struct dma_chan *chan = NULL;
 
+	if (WARN_ON(!dev || !name))
+		return ERR_PTR(-EINVAL);
+
+	fwnode = dev_fwnode(dev);
+
 	if (is_of_node(fwnode))
 		chan = of_dma_request_slave_channel(to_of_node(fwnode), name);
 	else if (is_acpi_device_node(fwnode))
-- 
2.43.0

