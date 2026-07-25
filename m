Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5245233924;
	Sat, 25 Jul 2026 12:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.81.229.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784982381; cv=none; b=Xmq1WIGg3lO6UD2tZgWPm4lzRtlp7YDD3r/qEbIGt0I8f9PlNwWv7Lqt24z6qEN8oSkFyyWaXy5+Ei4smEjDXggrnDrIv9t9oBa+6EtAAsEdCnNU4FYQ3iVD+cOy5BhMQXdLrPG/Y/hQD8R55iL3G5h43e8XulGqlPxhK32vkXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784982381; c=relaxed/simple;
	bh=7EeCEmZ4bq+PYKDjHXdTwNvCZhBJvKw3SGWs3Ys7fr0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=K4Fsy7FoqDtb69Pi6CqxHUlixLXqpqB5kh4yKeUCz5G+B0B9/wpt6V4GqwhSKh5t48Ehi5PRnzGG8+oLcrHvFvDslqWq/e45iNwIHpuvah47bGs6gVzQsGEggAoZnuf+8yu92CBFYppdJRso8kxIJjxPKkiVTA/aM8hmlYj70fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech; spf=pass smtp.mailfrom=chaosmail.tech; dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b=VEefaWNY; arc=none smtp.client-ip=77.81.229.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b="VEefaWNY"
Received: by chaosmail.tech (Postfix) id 099351C867B;
	Sat, 25 Jul 2026 12:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1784982369;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gFJh3NjTJMaox2+ypOqsAApzXWebSJmYXYJ3y7rrITw=;
	b=VEefaWNYJY/QC6elDXmRWcvVzTm4TRhGFTWVouKhcCWOPH86wTCsaXt/aLQ6lbPBZeuuev
	yWNUqCz8YVdt9fsxepscrT1hKru10b0YownvOyF8ifIJgLdtZ2tnV0obrHTixL1jTv3W7g
	N04YSffuBKUNQ/quPKVqaeraKreJg1Q=
From: Sasha Finkelstein <k@chaosmail.tech>
Subject: [PATCH 0/2] dmaengine: apple-admac: Add support for M3 generation
Date: Sat, 25 Jul 2026 14:25:55 +0200
Message-Id: <20260725-t603x-admac-v1-0-6a4dec023f02@chaosmail.tech>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMSQqAMAxA0atI1hZqncCriIs0Ro3gQKsiiHe36
 vIt/r/AsxP2UEUXOD7EyzIHJHEENODcs5I2GIw2hS5NrrZCp6fCdkJSmFhdoiGyeQahWB13cn6
 3uvntdzsybe8C7vsBoyEfJW8AAAA=
X-Change-ID: 20260725-t603x-admac-a1b07a2ccb54
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Vinod Koul <vkoul@kernel.org>, 
 Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sasha Finkelstein <k@chaosmail.tech>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784982368; l=898;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=7EeCEmZ4bq+PYKDjHXdTwNvCZhBJvKw3SGWs3Ys7fr0=;
 b=kiTk1Ew7+hmnffjQ7TcQmgvpzug51KIryezg96SJgX0fZGsg8ltjcTanfqfXFYIhzKIyOWgT+
 C7yMFlXqw5ODIBbzwg1EiMuiNR0b1dI3G8I/C2tmS+8fLY9YlujpIii
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=

The ADMACs present in M3 series devices (t8122 and t603x SoCs) need
additional register writes in order to function correctly. Add a new
compatible chain for those, and change the driver to do the write.

To simplify the merge strategy, the device tree entries will be sent
in a future patch series.

Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
Sasha Finkelstein (2):
      dt-bindings: dma: apple,admac: Add M3 generation ADMACs
      dmaengine: apple-admac: Add M3 generation ADMACs

 Documentation/devicetree/bindings/dma/apple,admac.yaml | 10 ++++++++--
 drivers/dma/apple-admac.c                              | 32 ++++++++++++++++++++++++++++++--
 2 files changed, 38 insertions(+), 4 deletions(-)
---
base-commit: 0ce37745d4bfbc493f718169c3974898ffec8ee7
change-id: 20260725-t603x-admac-a1b07a2ccb54

Best regards,
--  
Sasha Finkelstein <k@chaosmail.tech>

