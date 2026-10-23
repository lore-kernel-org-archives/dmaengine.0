Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792740737;
	b=KgDGNIhRBpbUSoDysW9Og7nuXA5R4H26q8r4z58ookAubFAAXwzIxddNhROtQCFeelVb
	 f/KC3waC0VOkpf4nFMgMZVEEY4tPaU6BCp2gNx7l8e1w3oj5eHfLmEFcxK6Zj+TDejhWt
	 CX42ppE0xdRBbxOzwS5nPydcwqWP3LLk9LEWeKx7e3gDUeAmWBXB+wl/YiV+YEczt0wKJ
	 iIZZIQtJeyV9IpToBVwtX8DTHyA5O1GBDkPQ3y92x4q+mW/8VpMfBUpO+cGrvfGvVQhdQ
	 h4FzREQz3mjSXvjiT7ER86Ti1JtqVUcGxgY3+L+HMIYcHCLaMpQw6d0W2NKilgrFE3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792740737;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bhnlngDTdPCRzQ3WfPeVfNn/5dfQaEbDCnTEYto+WIk=;
	b=uR4oulK9cWLB/5y7mqfIOyXxeU+KNn9EOUcJFbkLdQQlw+Ztn5z0sE3bL7M9ZGDzriB2
	 aeokB+y2Z1k3vvuuGbj1VLZnd12iMYxoF5QaaQR1ZydZiXNJ8LimK/a8X/4q5+v3ljpm3
	 0EGGBkCESuMUxZIFeaBcM9DOKwrQ/qGIFPKhBACKVDq5kh3qqCA1S5Sg7WmKh5/kPdfIp
	 Nj/QXAJhArlQedmw+E9Y0LpZ13HDomfiFw+JbVapaQAGcOs4ct5Fsr/nHOUMbzzzzZGNs
	 LdClCfRTwM7t86Z2noigK41UGIJjrJfh1EaMDZ4kpoTDbHfgXTvgUJzDFvCiv3eO/Nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=d1+eVLMY;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A1E606A31A
	for <dmaengine@vger.kernel.org>; Fri, 23 Oct 2026 07:32:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34A1E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=d1+eVLMY
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ea7987517aso2863575ad.0
        for <dmaengine@vger.kernel.org>; Fri, 23 Oct 2026 00:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792740736; x=1793345536; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bhnlngDTdPCRzQ3WfPeVfNn/5dfQaEbDCnTEYto+WIk=;
        b=d1+eVLMYtXs0c/wY+D+8tqUVklOiPZV1r/PQ3RY7YaNYpOGlGBu5YWT9hIPUnww2eG
         757QD4qV6c7lJZJ5RJ5UOlExl+FgIi98uN3v8UJI7DNVTppGdY4WlABffWATu1IsP763
         RZZE941EiVPOjd9pcrvf/MTX9O3RH/XOaCq4sqAfkAMcAINYiciJw+lM2Z59dR2fnu/h
         D6FyX3YJXYYb9MvNIEpWgZaHxSGEfw8GpYWuWiwhyOgelg9KKN+ZNcTnvkMkTriGf9rj
         takfVi5mvcrHrKfp90V+ffHvQXZwdkHZWW5If72hirpLtbYLIEGlVkcG7+cl3jWNr+Ht
         kW7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792740736; x=1793345536;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bhnlngDTdPCRzQ3WfPeVfNn/5dfQaEbDCnTEYto+WIk=;
        b=i8lHlheYpQAKDszxSxy7BTvPfRthFHJ/zoybxUxJW2ccKscvYgDx0qNv1mOjx70hlN
         XjY8wqopapDU/EVXpUGSxmyZEzmJvhjCGNhtFQwO4rimxRUw2R9YqdCceb4oLjNabvyu
         AoAwYzRWCI/lMj68sZxNE9/xRKKjebn9+hKNnTAwMpkUKdP2JTcpsSrJEgjAxJKLUK4N
         ICoLcEp0+7eeOFE13E0SWhhSuBit+vOzR1A147Gn3IrVsfphktRznRLVxRj+9+9HnHGr
         VBnUyg7o4d0CLPoNFhjshkGA0QBbVhyWLzL/nvL22/lHWOsJOWCoNL0VM/Ks5KU6WZ7b
         c+1Q==
X-Forwarded-Encrypted: i=1; AKwUvBzIDUmMXn8fgALmh6bHE/J6JkmhFHWA7WYh+gqaVoU5xXqZ8y/nD5fHijT3HsyWPAzLBy9cQzLA6yw=@vger.kernel.org
X-Gm-Message-State: AFq9FYL4as6KNphgibgw8baggSDfD8e5btBnqaRHvs2iHHS7zvtOK+yT
	bOnRMKS+ckG4tdG/9Vxa2vptnwcJ21SGbOOQcvBrwxzjUBQbIYayCzGt
X-Gm-Gg: AYBFou1/UP/jUIYoYTJovQIEfM0nYkwdK48h0KmiSSBoV7GAKfrQnFHJEmdfuPrdiUM
	zoz3owapHViDiBDT+YwLW9W+83Sz43NWk5hXZFJNTj+zo6IXXWEA8hd2oI3gjAyTLMJmurY7jG9
	9oYNOLNqRHBkqPk2LJ1R75MB2FMNXYZCwTIi6htTwEV6YE8Gb1CnC6OGPnpFMncAuTHpzm2xqPb
	4PGYFpj72m3MmZpO55qKCV8iar2oNLwBxx48vS0pbi4k8ZG/JH12D0Us7eiIg3gHiIyy/vTZqRj
	mj8C/GovzOBXU2zAhKMLCyJ8sYAxrvz3DzUR1dGFm+ilGE2BOFQvjU+QOCQhmKjOoLGiqy2bPkO
	qFXEjjqKkEeyQ3b/CuoEpxmfPATn+6PTOd9c7Tyd420/2++MiaYkzvF0h0PWE54/5zn7K8bQZ5G
	M+gp4YuMdxo4wzZnr+FSruxU4SEG6qq3tRU+cyegF0QzHaiTBYwdxP2Ir5EoAd8HZT3CWJlvsCp
	rdYE81KNEYdEhec9mZfEWdezYCY0fyHAe3jaHiRBB5rmBCNO/S2733R8wAy0uEcioodn1Yf/RA=
X-Received: by 2002:a17:902:e547:b0:2e4:b112:14d with SMTP id d9443c01a7336-2ea7d132e9fmr13812005ad.54.1792740736475;
        Fri, 23 Oct 2026 00:32:16 -0700 (PDT)
Received: from spiderman.taila3fd8c.ts.net ([202.112.47.77])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea7b3a8cfesm6769735ad.40.2026.10.23.00.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:32:16 -0700 (PDT)
From: Li Ximo <lixicaicai@gmail.com>
To: Sinan Kaya <okaya@kernel.org>,
	Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Wang Haoran <haoranwangsec@gmail.com>,
	Li Ximo <lixicaicai@gmail.com>
Subject: [PATCH] dmaengine: qcom: hidma: fix wild pointer stored in mchan->running when active list is empty
Date: Fri, 23 Oct 2026 15:31:54 +0800
Message-Id: <20261023073154.744365-1-lixicaicai@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wang Haoran <haoranwangsec@gmail.com>

While auditing list_first_entry() users we found two call sites in the
HIDMA driver that invoke it on mchan->active without verifying the list
is non-empty. list_first_entry() never returns NULL: on an empty list
head->next == head, so container_of() produces a bogus non-NULL pointer
into the enclosing hidma_chan structure instead. That wild pointer is
stored into mchan->running, and is later dereferenced in
hidma_tx_status() where "if (mchan->running) runcookie =
mchan->running->desc.cookie" passes precisely because the pointer is
not NULL, yielding an out-of-bounds read / memory corruption.

The list can be empty at both sites on entirely normal paths. In
hidma_callback(), the completed descriptor is first moved from active
to completed; when it was the last active descriptor, the subsequent
list_first_entry() runs on the now-empty list. In
hidma_issue_pending(), a client calling dma_async_issue_pending()
without any queued descriptor leaves both queued and active empty, and
the "if (!mchan->running)" branch then fetches the "first" entry of an
empty active list.

Fix both sites by switching to list_first_entry_or_null(), which
returns NULL for an empty list. This makes the existing NULL check on
mchan->running in hidma_tx_status() effective, so the paused-channel
cookie query takes the -EINVAL path instead of dereferencing a wild
pointer. Both call sites already run under mchan->lock, so no
additional locking is needed.

Reported-by: Wang Haoran <haoranwangsec@gmail.com>
Reported-by: Li Ximo <lixicaicai@gmail.com>
Signed-off-by: Wang Haoran <haoranwangsec@gmail.com>
---
 drivers/dma/qcom/hidma.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/qcom/hidma.c b/drivers/dma/qcom/hidma.c
index c939635be..925c912e0 100644
--- a/drivers/dma/qcom/hidma.c
+++ b/drivers/dma/qcom/hidma.c
@@ -176,8 +176,9 @@ static void hidma_callback(void *data)
 		queued = true;
 
 		/* calculate the next running descriptor */
-		mchan->running = list_first_entry(&mchan->active,
-						  struct hidma_desc, node);
+		mchan->running = list_first_entry_or_null(&mchan->active,
+							  struct hidma_desc,
+							  node);
 	}
 	spin_unlock_irqrestore(&mchan->lock, irqflags);
 
@@ -238,9 +239,10 @@ static void hidma_issue_pending(struct dma_chan *dmach)
 	}
 
 	if (!mchan->running) {
-		struct hidma_desc *desc = list_first_entry(&mchan->active,
-							   struct hidma_desc,
-							   node);
+		struct hidma_desc *desc;
+
+		desc = list_first_entry_or_null(&mchan->active,
+						struct hidma_desc, node);
 		mchan->running = desc;
 	}
 	spin_unlock_irqrestore(&mchan->lock, flags);
-- 
2.30.2

