Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981194854FF
	for <dmaengine@vger.kernel.org>; Wed,  9 Sep 2026 09:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788946857; cv=none; b=UV90IZEqgWhY5aTZC1f7MJDIWmF8VguM4AxAPIA7O+DOJXH4Jp5sqhjv6oBUTK/uU4chUx47jowCL7hxH6hihnHnzp/K02zcZL94MvTN48Nt92lytfZVxdG1oqBgeWP9xZ/04cCEoEZKUn8s4bkx/Qgq0KpPR/hE+CSEGx5SJ9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788946857; c=relaxed/simple;
	bh=uKTxOnZPvrFoD1q899d8s5uKz14AQFUzSpF2EYg4ta8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mZcp/43yrrDaHwobFEpT8f0P8NQJzA+kVb/SmScuR3ImOePzt6TC/tusSYKtqTBPQp2AC2MKljJOvBZIqMgdC3EdUAfjpFe+NvjLQDk1NEH633p/WRKWgba2HtXWD+hJynoRKl4z60rKY1cxxgkxwjdpBFpSdL9CSJHF9nR8fCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=EsSQ5+FR; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="EsSQ5+FR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=w/XrFrj1BK0Io2
	iGIOzmUF/QPyPwxY0/JAzWRR1pl+8=; b=EsSQ5+FR4t0H2GTTBxdVkfNCdCdWx+
	cyeLIG7mLeUsXk0QDEFXv3ZzZiTRX1Hg9QSHZt75sKKCk0HPBPXy/2VMUU0+tk5/
	0NK43cwzcNJ9xbX/7vSBLuIxAQjCAiUifRICk9O2EdnyeHiqmT8n0HY+/vxdfno1
	L7XDL8YQ/z1K3IQ+WLHjJfWKUPHYDKKgXUILXC//e7L6nBMhGiDgSO4RfbPuDNN5
	tiwzF/FaDxLN4/EdcY8t3uVy6cP9yUN09F+Zr736rjkB9GeCPqWxU3Yxg7lEt88J
	lXmV9JrOiseWHNY7D8fAKAWmt7L0KPPhHs1tsGCnde81Hb2jlbH62IRA==
Received: (qmail 3072951 invoked from network); 9 Sep 2026 11:40:48 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Sep 2026 11:40:48 +0200
X-UD-Smtp-Session: l3s3148p1@uR1spQlbDqJtKXBr
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	dmaengine@vger.kernel.org,
	Frank Li <Frank.Li@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 0/4] dmaengine: sh: rcar-dmac: add R-Car Gen5 X5H support
Date: Wed,  9 Sep 2026 11:40:09 +0200
Message-ID: <20260909094009.2167-6-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Here is a small series with the needed driver updates to support R-Car
Gen5 and X5H for the SYSC-DMAC. Details are in the patch descriptions,
but it is all small stuff.

It has been tested on an Ironhide board (X5H) and a SparrowHawk (V4H)
for regression testing. The testing branch can be found here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/x5h/i2c-experimental

The patches here are based on linux-next as of 20260908. DT checks have
also been passed.

Looking forward to comments or approval!

Changes since v1:
* tags added (Thanks Krzysztof, Geert and Frank)
* renamed the ipmmu-flag variable
* some updates to commit messages and comments


Wolfram Sang (4):
  dmaengine: sh: rcar-dmac: fix style in struct initialization
  dmaengine: sh: rcar-dmac: SMMU doesn't need IPMMU workaround
  dt-bindings: renesas,rcar-dmac: Add support for R-Car X5H SoC
  dmaengine: sh: rcar-dmac: Add support for R-Car Gen5 SoCs

 .../bindings/dma/renesas,rcar-dmac.yaml       |  6 +++++
 drivers/dma/sh/rcar-dmac.c                    | 26 ++++++++++++++-----
 2 files changed, 26 insertions(+), 6 deletions(-)

-- 
2.53.0

