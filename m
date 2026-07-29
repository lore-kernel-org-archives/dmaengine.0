Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78660474279;
	Wed, 29 Jul 2026 11:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.81.229.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785325617; cv=none; b=csOA6Y+5yiuKsHqnKrh1BCSIOfS2gZ5JDB+ALzSLvN1PUeQV/MWj5kD26GK+Nd3blBoqzNWr4ADAcnpyvU3QdvYj1nT3fqo6XHCCS+8x50i93GJOJ1QoyimbA/TZV5+l+TCuU8WKkKWbRiadDdvXSL5YAZ6iPbv0xKTudm9Si9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785325617; c=relaxed/simple;
	bh=txob3eI5nMEhztwuDOLSLuf2Y6RtnMZ3xqeQjq/S33U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pB7Bt4D0T+0TstiTBKVobCLNs7OSqwE4RAYnZ9/RETmYVXlvz3TJP1peFhEyjebQuuzSZdGXKEY59wG24pBMXBWLJI9IdpwUKQxG+6KHAVZxKQv1j07aeF/mpSI9Q4S/pl41QdtSd3xi6GUEFWK66tjdqTIB9nh1V5Muig3tmmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech; spf=pass smtp.mailfrom=chaosmail.tech; dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b=wtrklbkI; arc=none smtp.client-ip=77.81.229.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b="wtrklbkI"
Received: by chaosmail.tech (Postfix) id 2066E1C87FF;
	Wed, 29 Jul 2026 11:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1785325604;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TJlUQBhAC6aUWtVfrdOpWDSFGGPM9jrCv1lIW27G7s8=;
	b=wtrklbkInNY2O2TVvp2pOaOLP9KUojp0be8GPyab+8DDL+3xTZEvqSMZCKDnam1BqyCTBW
	ROlAZG6gk5j5AyknbHiufxAXuTie+2boU9s0khsXPnc7gRlsVEot87Kn3si1kC8zA31fqr
	htNJjAYlWpYE1we48BeJbs+j/SZ7GW0=
From: Sasha Finkelstein <k@chaosmail.tech>
Subject: [PATCH v2 0/2] dmaengine: apple-admac: Add support for M3
 generation
Date: Wed, 29 Jul 2026 13:46:33 +0200
Message-Id: <20260729-t603x-admac-v2-0-e4b2bb6ca45e@chaosmail.tech>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22OSw6CQBBEr0J67Zim+SWuvIdh0QyNtBEwMyPBE
 O7ugFuXL6l6VSt4cSoeLskKTmb1Oo0R6JSA7Xm8i9E2MhBSiRUVJpSYLYbbga3htMGKydqmyCE
 2Xk46XQ7brf6xfzcPsWFX7IlefZjc55ib0z333zynBk3JeSsWKeuQrvHN5AfW5zmI7aHetu0LI
 34JkL0AAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785325604; l=1027;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=txob3eI5nMEhztwuDOLSLuf2Y6RtnMZ3xqeQjq/S33U=;
 b=R1Zy7hMrACQDUbNj7a7ttlnRCZvyupAqNMGtL61vQLDG/OKvHimLs8au9952OgHa657pgGrqW
 y5tt9YYkhqVAYRSufJRMQ7vXlFbiEUppT8cmJ1m0EprMYGTCxQVGs8O
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=

The ADMACs present in M3 series devices (t8122 and t603x SoCs) need
additional register writes in order to function correctly. Add a new
compatible chain for those, and change the driver to do the write.

To simplify the merge strategy, the device tree entries will be sent
in a future patch series.

Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
Changes in v2:
- Typo fix
- Link to v1: https://patch.msgid.link/20260725-t603x-admac-v1-0-6a4dec023f02@chaosmail.tech

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

