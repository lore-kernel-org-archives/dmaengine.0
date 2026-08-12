Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D4A403144;
	Wed, 12 Aug 2026 09:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.81.229.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786526808; cv=none; b=vDKDDnbEyYMCU9AClX7fBDgcGyn0AdyyDtOJYZQaDwhAY2qugCVRN9RNCtlfApXs80g+LIpFJ3LquKAhjhiWIlrBG+SsPEgL35CISmU7JMTXk1ufQuzP/5ie8OTX/Uhi+mMNpCgupZEsBPceaRdzeo4BM1DzRVn1g832Tw3Geag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786526808; c=relaxed/simple;
	bh=3u3QE19SmPpO/aRh7YhNURUWTLddt0t0CS44cHgFr3U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XYrbskrQHWYbKQKBjhgYT6Gl5tSWy847tlB4QjOQgVE0s+q1GCrX+eX/Vq18tOSnhN+z4Sc0SsJoNga8VmWdm12Q83iRVNaJw5pgUU9tSnaR9UkC5NCUhLqM8x3Gv0hcv9oU4uBQB+4cPkZV6WEN/9X5fXLatEJWrEVKPseqJlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech; spf=pass smtp.mailfrom=chaosmail.tech; dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b=ZWIqQpVt; arc=none smtp.client-ip=77.81.229.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b="ZWIqQpVt"
Received: by chaosmail.tech (Postfix) id 9D3AB1CBF47;
	Wed, 12 Aug 2026 09:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1786526798;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=f9AVvI/rzO1xlw04zuQKTwjeDA+3NqKNZVc0uqJpvu8=;
	b=ZWIqQpVtS+Atl0Z/sP2B6O3bEQ4MDdjCKBnSy54gc7qKXk28Msr6airV21WeLNnb1YK9Nq
	AU8lD3kUziZhCahn4xPAu7Q8HxkZenQjs1HvbIiYhdw+vC7e7SeyOChsupHArvPQxXQQ6u
	dgGAW0z5VSOGMHMyZFyV5xTzyQjqe7w=
From: Sasha Finkelstein <k@chaosmail.tech>
Subject: [PATCH v3 0/2] dmaengine: apple-admac: Add support for M3
 generation
Date: Wed, 12 Aug 2026 11:26:32 +0200
Message-Id: <20260812-t603x-admac-v3-0-d1f137f803e1@chaosmail.tech>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23OQQ6CMBAF0KuQrq0pQynRlfcwLqZlkBoR09YGQ
 7i7LW40uvzJn/dnZp6cJc/2xcwcRevteEuh2hTM9Hg7E7dtygwEKNFAzYMS1cSxHdBwLLVoEIz
 RtWTp4u6os9OqHU/v7B/6QiZkIjd668PonutcLHPvvxxLLrhC2ZIRUHUCDumb0Q9or9tApmeZj
 /AJ7L4BSABJDVorg7KmH2BZlhc1I2lU/gAAAA==
X-Change-ID: 20260725-t603x-admac-a1b07a2ccb54
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sasha Finkelstein <k@chaosmail.tech>, 
 Joshua Peisach <jpeisach@ubuntu.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786526797; l=1162;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=3u3QE19SmPpO/aRh7YhNURUWTLddt0t0CS44cHgFr3U=;
 b=SPFkVGKOfj9cw1v+THOzC4ymtBZRhIOgNqarJLO50npnORVat3BScv3f+tPc2d0rpKu3Etv+M
 6DpKVn4jhJuCsm3YtGfKtA7b5DJhELa7pB0Hr6Z8G/vwnTaAPjqo3K0
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=

The ADMACs present in M3 series devices (t8122 and t603x SoCs) need
additional register writes in order to function correctly. Add a new
compatible chain for those, and change the driver to do the write.

To simplify the merge strategy, the device tree entries will be sent
in a future patch series.

Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
Changes in v3:
- Use t8013 hw data as default
- Link to v2: https://patch.msgid.link/20260729-t603x-admac-v2-0-e4b2bb6ca45e@chaosmail.tech

Changes in v2:
- Typo fix
- Link to v1: https://patch.msgid.link/20260725-t603x-admac-v1-0-6a4dec023f02@chaosmail.tech

---
Sasha Finkelstein (2):
      dt-bindings: dma: apple,admac: Add M3 generation ADMACs
      dmaengine: apple-admac: Add M3 generation ADMACs

 Documentation/devicetree/bindings/dma/apple,admac.yaml | 10 ++++++++--
 drivers/dma/apple-admac.c                              | 23 +++++++++++++++++++++++
 2 files changed, 31 insertions(+), 2 deletions(-)
---
base-commit: 0ce37745d4bfbc493f718169c3974898ffec8ee7
change-id: 20260725-t603x-admac-a1b07a2ccb54

Best regards,
--  
Sasha Finkelstein <k@chaosmail.tech>

