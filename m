Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="IUmqAssV"
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C5F7B6
	for <dmaengine@vger.kernel.org>; Fri, 24 Nov 2023 07:09:25 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6817140015;
	Fri, 24 Nov 2023 15:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1700838563;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=92696hVsxzgPIk14w0tuqcfEIbUVwHf6yVlhjabt/dQ=;
	b=IUmqAssV1yKwEulkj0towUuc5muW1SNLwhfECxdT/L35udTYlMmsjhgoZphIamG181q4QX
	uAhoqtVQ2Ml8JcuXYOX3ywkpx6kHlJNtas/w8/mCebilscTv1Jbifzi44qHAX/USDkyFYn
	Rk2S/j3mvyn5KSPhPG4599YSHmjiiL+7yBZKmj3+/69uARuZ8JcucdGOkqQJglUZZeUPfG
	Uo5SGAGJnQ9cQ7SDnQHjP5QIQl0054EObkXiX1G97Jcb8A73X2JmDEjkyd47Uk8mDa8R9k
	I3pc4ZdasJNEh/elolAT15vpNcH9JKIAnICDOnlaPRDncpmaaA3ahyMlXmcf4g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Vinod Koul <vkoul@kernel.org>,
	Lizhi Hou <lizhi.hou@amd.com>,
	Brian Xu <brian.xu@amd.com>,
	Raj Kumar Rampelli <raj.kumar.rampelli@amd.com>,
	dmaengine@vger.kernel.org
Cc: Michal Simek <monstr@monstr.eu>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 0/3] dmaengine: xilinx: Better cyclic transfers
Date: Fri, 24 Nov 2023 16:09:20 +0100
Message-Id: <20231124150923.257687-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: miquel.raynal@bootlin.com

Hello,

So far all my testing was performed by looping the playback output to
the recording input and comparing the files using FFTs. Unfortunately,
when the DMA engine suffers from the same issue on both sides, some
issues may appear un-noticed. I now have proper hardware to really
listen to the actual sound, so here are a couple of fixes and
improvements.

Cheers,
Miquèl

Miquel Raynal (3):
  dmaengine: xilinx: xdma: Fix the count of elapsed periods in cyclic
    mode
  dmaengine: xilinx: xdma: Better handling of the busy variable
  dmaengine: xilinx: xdma: Add terminate_all/synchronize callbacks

 drivers/dma/xilinx/xdma.c | 73 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 71 insertions(+), 2 deletions(-)

-- 
2.34.1

