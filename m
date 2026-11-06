Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793949972;
	b=BbhHhy9Xr9Rt2qbtY801yiYmfGzYGV+4yW1zHcfrzv7CPFRiPqq18z65rTTUr4Js+PfD
	 tiO/0RuJAKphxW/hQ9ceexV3DGDuefY7B+rAn7jeu02AA01SsLv5isl5b/ivBINeKLpCZ
	 YYq8GOUlAc5b7KaoxQaloxGMipvN8ACtEloG1jIStOzzaVDdkCn/6JHx24eWtbuaF4SbQ
	 LJHpKEOxoZgGtJ0eo12wo99E+OhiNsD/HU157cl80naR8dFAjj6Gw044KEKrSj+YkQT2Y
	 KJ8XBpHn1sYaX/0TGz4oaEWlAlHNcyJ3so7I3sDpH+pau9sWlSUtJS275FGVqjHIOrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793949972;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=h6iC1BFKziQSdkT7Y3Z7o7DDpetOO4YQdmgmOckELCw=;
	b=5GrKKLMimRt3wxNJz9f8wOVrNHE3N0nfehdT7jvHgR4OyK2p3LSr7gDJNTwHMQUw6VIo
	 Bm6f/snw7ok2VAJyq9mNQ1er4ppck20HDJ2ooyWZa6dkjFg+xZ5doOG+HBDFjwNna7BYG
	 g/untMFORaOgWoIN8X2RyfZQKRfSThfQwsMWTWBarNbVqKcIu8z7vWasIprgofXQ3eHI9
	 /t43BSy3Za2iPV+CT4qQJBYxatdvrcuHXaMrp8U0X0Vkan7TYOfV3xQdpxbqqb/5ClLmq
	 1s4QGHbWqEH9mxvUFe7Zb1VhoEys0MSNV5OrnUXRLy01GEuJaAYr4X+g7EINX33Nigg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MemkxiN8;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85D5606A334
	for <dmaengine@vger.kernel.org>; Fri,  6 Nov 2026 07:26:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D85D5606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MemkxiN8
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e987a2ba0cso1634015ad.3
        for <dmaengine@vger.kernel.org>; Thu, 05 Nov 2026 23:26:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793949971; x=1794554771; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=h6iC1BFKziQSdkT7Y3Z7o7DDpetOO4YQdmgmOckELCw=;
        b=MemkxiN8/ymp8wHEishBUH1i7zVz0CW1FMzpMHzBbgM9Ip93h/prcUolyjq8y7f/pk
         KcKzls839oqBARMiSLwn2NpM1qrjKTeIRP+kZ0GeGuK8NisutI7qItJ7PPt7RumuIbtS
         pj9cgd6cn+/iK0kW8K/37J7JiKGMIXGzngWaoRz/piRe4/zmFdUl3+ECJCmFJ7wPzXIY
         svOEJQ9mAHayTHEuF5opvpSLIEM4a/En3uaKJGzs3pJzRakN3JBebvqvccQ8gFAlphxc
         05UcUwLXsV/Beu9UTXO2Ps/Ktt64HI3+FPKGxQJjwk2Vv8xSZF0V3rOZREopuaX+r+tp
         1w7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793949971; x=1794554771;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h6iC1BFKziQSdkT7Y3Z7o7DDpetOO4YQdmgmOckELCw=;
        b=avjr426LXUxcGmSn+ROEIEqVMAHKsLGmX/AD8jy37kPZeTFtHy28jMJy5lMxx5LAr5
         adLLHoj/AKvcjxMPDMu5BfplLLqc8n07Ga5RQa9E05YiBk+53nssEIsh6ob3mxj1mrfw
         LRsdzoZLegxP/3w6Cf+MUA74oUWeQLbt2OVbswjCgum/aeZzw4o619ymB9HVuq1AVr0v
         81qnlbBlRSxTx4AIzMjQxSd9ymV4BMDKrEtgcyGMdB6wcQkUhR1SPiyFcj6Kxf0FAYDj
         6hR40lTY9pTpffS6TVZ77MB3UleLD2MtJRVfT3TQYLQa7DnxMoa6Kbd4kjhR08KiKq7E
         DIjw==
X-Gm-Message-State: APuU4Z+EM5GOXhg49ZPVzevx/8Hs0aYFLeUbV9BaDhupUh3DJY4IiRup
	FbVuogI//+bHhD3gIZff+K4EinghTSnE5gZqUjHWIWFd5/dnRmhD3i3A/DAb8dGk
X-Gm-Gg: AYBFou08RfK9BW2oAUgxGy58MNz2OxwzPbM2KjB93qo+Lc7kQdglUfCnKQRlmjeJv5+
	ZeBa/6kZZ3MDesnCICUY1OfymHdO5+XmkP7i7N5HH7M9s+eivgx5HztcFFoZDd+ovmFJbsYFKgr
	wcX0NnxLJZ1+Npl5Vrov/WFO33xGgBRONANuctRUKit4uiEoSwIi5mXb3gqHkCL1CU00SKWqAUd
	ABWpJIgW5ud84QK4TcrwugAJQtj4UGXPDLm5XhVXoOw7KNG1uY6Hn8f6Ig3i0SjB/wykmSCgi+w
	v6TVb7xw5rQHlnXLMcMXynLqYFMtFeBIM73pqrfC3E8y2zYJUT485twZujNNw3D3XUAxw/Dsnkd
	icchmnARa4zcJQhhmlopm4j+agsqXnLEDap6tOCUOkbzYFQpg0I3FvEgRY6uqfe3ccL0FjpInEs
	U8UprZDtLeOmsQ5I4GB+bnZPeV8SZr7FDlIo5LoIiE75VkoxUqymVdcyTuJ6Kv3pT5a8fnkgIMg
	Gr1k5/xTp1QZg7n7TrvU4kY+JAfZeJsVLaQtGTB3LCEu8LvtS8zlDg8/C2mQb0AwsP5IiYpsVmy
	+falaKMUR6x+i4lVQpp6xw5zpPHQvPdikyygwI+XtDvIx5BRx85S
X-Received: by 2002:a17:902:e5c3:b0:2e9:5d1f:dffe with SMTP id d9443c01a7336-2ed40dec190mr22310705ad.57.1793949971038;
        Thu, 05 Nov 2026 23:26:11 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:7680:28::4:396])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed47d89976sm2633715ad.66.2026.11.05.23.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 23:26:10 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: dmaengine@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] dmaengine: pl08x: Support the Hi3798MV100 PL080 variant
Date: Fri,  6 Nov 2026 15:25:57 +0800
Message-ID: <20261106072602.77560-1-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Hi3798MV100 (HiSilicon HiSTB) carries a PL080-class DMAC. The block
reports 0x0a141080 -- the ID reserved for Samsung's PL080S -- while its
register map is plain PL080 and the instance has 4 channels instead of
the 8 the plain PL080 entry claims.

Set the DT node to arm,primecell-periphid = <0x00041080> and
dma-channels = <4>, and apply the two patches to add that support.

Tested on Hi3798MV100 hardware.

v2:
 - fix for shared reset
 - use local copy of vendor_data
v1: https://lore.kernel.org/r/20261104154542.3131916-1-mmyangfl@gmail.com/

David Yang (2):
  dmaengine: pl08x: Release the reset before reading registers
  dmaengine: pl08x: Use the channel count from the device tree

 drivers/dma/amba-pl08x.c | 34 ++++++++++++++++++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

-- 
2.53.0

