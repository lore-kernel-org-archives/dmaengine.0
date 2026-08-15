Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A64C25B091;
	Sat, 15 Aug 2026 10:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.81.229.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786790516; cv=none; b=kJeH/jabT1a0k8qUC1BRQyKSMakou5MdpmwCY56UX1XlWsdmuSlKbRo94VmwSyZ7MSMQwsVnHO9GmkQNu1wm7DXxn0CoIbeDyhbkZLM1TsdYfGRThTv42G4tDhYEp/9a0BDlmsmpriCCfdzn5dSsszdMukEDA+ZSSXaElXaTTd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786790516; c=relaxed/simple;
	bh=gUpTW8ChxtDggBwLocbC7PiTUaahIfyT04dtaB20q38=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ChAcoeRhRLSzDj5ppwX/0CkTwWH9oRHbUGg0el7RlFqJRuG6hf+jwllI79SxzdIu9wWICZkttIT7ek3K3U0t+xNinJJp7VNOKMD4s4tO7NRJOH/crvdU/z5LwcfDVIA32lpPeg6dwJgcxibeyq7cVpF/owYHTIkhBNwmRUgYJ0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech; spf=pass smtp.mailfrom=chaosmail.tech; dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b=r40Fx8Cy; arc=none smtp.client-ip=77.81.229.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b="r40Fx8Cy"
Received: by chaosmail.tech (Postfix) id E76F91C975B;
	Sat, 15 Aug 2026 10:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1786790509;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QirL5FKN/2t0jHFpC8PFoZ9D0UWW7b92xqp9wz3wT6w=;
	b=r40Fx8CybGZdbtQlvJRS6vqtk2xzQheD4l/LpCrZyn48Axr/ykokbCq6XEWwqvXa2TCSfa
	WRc4uSrmENuRLgmoc5K1Gag/XsOxKMpqxwVb73JD3/cAnwzXzoSizHBnzjZ0fZJqfqcMWY
	am1qIpPkLGarTKdUSNVYe83UzlWnFEs=
From: Sasha Finkelstein <k@chaosmail.tech>
Subject: [PATCH v4 0/2] dmaengine: apple-admac: Add support for M3
 generation
Date: Sat, 15 Aug 2026 12:41:37 +0200
Message-Id: <20260815-t603x-admac-v4-0-1149e342dcb0@chaosmail.tech>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23Oyw6CMBAF0F8hXVvTTstDV/6HcdHHIDUChiLBE
 P7dFhdKZHmTO+fORDx2Dj05JhPpcHDetU0IcpcQU6nmitTZkAkwyFgOKe0zJkaqbK0MVVyzXIE
 xOpUkXDw6LN24aOfLJ/unvqHpIxEblfN9272WuYHH3rY8cMpopqRFw0CUDE7hm9bXyt33PZqKR
 H6AX+CwBiAAKDVonRklU9wExBcoOKwBEQDLSy7ysmAC+R8wz/MbdjY47j8BAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786790508; l=1308;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=gUpTW8ChxtDggBwLocbC7PiTUaahIfyT04dtaB20q38=;
 b=tozvc+d4nHbhxUlhjey4KOadNqu1jnonm2ocdhCV+Q1b6haoJDrrIhCERmWAOKiupWpcgCkAa
 frU50DS+KzrCJr+XP6KJwk609S+xThfBfJwqXB2BR2xs8eSMutsdO4m
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=

The ADMACs present in M3 series devices (t8122 and t603x SoCs) need
additional register writes in order to function correctly. Add a new
compatible chain for those, and change the driver to do the write.

To simplify the merge strategy, the device tree entries will be sent
in a future patch series.

Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
Changes in v4:
- Use the entire hw data struct
- Link to v3: https://patch.msgid.link/20260812-t603x-admac-v3-0-d1f137f803e1@chaosmail.tech

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
 drivers/dma/apple-admac.c                              | 24 ++++++++++++++++++++++++
 2 files changed, 32 insertions(+), 2 deletions(-)
---
base-commit: 0ce37745d4bfbc493f718169c3974898ffec8ee7
change-id: 20260725-t603x-admac-a1b07a2ccb54

Best regards,
--  
Sasha Finkelstein <k@chaosmail.tech>

