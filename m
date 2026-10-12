Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156B848A8C6
	for <dmaengine@vger.kernel.org>; Mon, 12 Oct 2026 12:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791808239; cv=none; b=NhgYi0UKTzIVQhPPgY7UN6SBOZMN7OYsux14C86a7asunVG29/TAcM71pe/lQW3EHi+AHqxpDhD5rZWyuCb3gqTW5bV/MDQxS1DYO/aZscqkrpfFUTEbaKz711UCH1akPqK7AaAutA2yVai9v8F+vdn2QR72DqV8TNG8cbjpiAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791808239; c=relaxed/simple;
	bh=LIwX4BoCc2IFfmbe5qo36f9DInTdxObqNyJLJ7ZFMFE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Vv7ATsQKXh5KdKUfBO94x8f6V48rUAHqiJbV3CjYFD7u7cUgX4KlrThIL604AiGkXH5PYCKPx4YglU9wd+pL4bJfOxeHDVkUUiDTqA2KDkA4Oz68JulwsDe3tdKyn0unhnCDOS7gQn/UCtOBnHW2TgqUqcaT0Ura6DJxXq+DxMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=dpcJstJP; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="dpcJstJP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=FNBu38eUy5zI/s
	W01wF2yP5AeBvQ62S98/x/2VTmWVk=; b=dpcJstJPjpESJ+A6UlgrWcdjnJGR5+
	YZGZ1isDa4lHs731TTVy+FltjZGmbXOuQXjk7Paw01RHo5CJNjN2sPVVL9w1uUhO
	kI3r3msK3CzK5IWHdpCzGrFS1/LWaVH8eSy5Z7oS0yLXqfAgpzF9NJaDafS7h0Tl
	Rz4vbjhWRrNLIJkdwiso6xPySp8mcdQbS3W39EXKk+Ajya5U3Qufa5mTtB4hWitu
	0/45pFPpKPcIYBP6sOqhsemczFyFpEWlYSpjkOt3sbHCR2ljqKUDyKDzeSRPxp/F
	eljHeS0ch7G9G3MiZ85QumffmsMkfs/D9C+M6BxznJXZWfqvyJ0h0doQ==
Received: (qmail 2248060 invoked from network); 12 Oct 2026 14:30:32 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Oct 2026 14:30:32 +0200
X-UD-Smtp-Session: l3s3148p1@t/Yo3aNd0sUujnuu
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	dmaengine@vger.kernel.org,
	Frank Li <Frank.Li@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v2 0/3] dmaengine: rcar-dmac: collection of small missed fixes
Date: Mon, 12 Oct 2026 14:30:20 +0200
Message-ID: <20261012123020.11320-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While working on this driver, I found that there were these small fixes
contributed in the past but they have not been applied yet. So, I
collected and rebased them, added review tags and minorly improved the
commit messages. For v2, I addressed review comments. Changes are
described per patch. Please apply.

Tested on a Renesas R-Car X5H Ironhide board and R-Car V4H SparrowHawk.

Koichiro Den (1):
  dmaengine: rcar-dmac: Add missing dma_descriptor_unmap()

Pan Chuang (1):
  dmaengine: rcar-dmac: Remove redundant dev_err()/dev_err_probe()

Zhang Shurong (1):
  dmaengine: rcar-dmac: Fix PM usage counter imbalance

 drivers/dma/sh/rcar-dmac.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

-- 
2.53.0

