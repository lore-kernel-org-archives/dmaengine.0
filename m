Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFBE53890F3;
	Tue, 13 Oct 2026 04:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791864519; cv=none; b=sjdn+oZvmfflOaEbWCHbClBi4TPZRhlV45pJq1zWckkNfPL7XGgT/i49x9PdRpQYxk/QPRHE8doULiYhtctI1o2Dj5RH0CuGSrYmVk5wGSyrh1sIa/wlNZYKSa+EOCNvGONISr7wEpei4RNJHyzywP0OzDsZxBCUpSlFWyZCJew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791864519; c=relaxed/simple;
	bh=IGWqW6ujQTcGWGsM5poJEmQomlbmoz9IGg/uiVarHPU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hPy02I51egJ84v2oft2yUr0chQbvN06p2RRN6UqK7h5/ftfqJIwYXOpoBU9/NzaUpf5LBdcxe+DbKpVDIPI2vHFRIpGkpNcLHJJfjAvSOL2/e+hR5VhEg0VesbGBboPemkdIK0YWORvozaRnYbV98WOYaYTJCdZKGAIkDZlBMPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=QBje+CHS; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="QBje+CHS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=IG
	WqW6ujQTcGWGsM5poJEmQomlbmoz9IGg/uiVarHPU=; b=QBje+CHS2noinMxsnG
	oUeGhng9kZ+v5xhybpY1rQONcYHVvd19Gxk5jjlkoThe6qDSXJa+TqqJhNsyjIc+
	kFiPS1v93YLPglwaNt/6DLQsAdEqRjJFguQKaKJum7StnRS0RFwBHDaMLSOTNieS
	VVDIqH73T786aEq3QTPZ05Jmk=
Received: from LUOBO-DINQG8T.hobot.cc (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wC33w+zrs1qYTnbEA--.4316S2;
	Tue, 13 Oct 2026 12:08:21 +0800 (CST)
From: Rui Wang <wr574332525@163.com>
To: vkoul@kernel.org,
	Frank.Li@kernel.org
Cc: Eugeniy.Paltsev@synopsys.com,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6] dmaengine: dw-axi-dmac: report paused state and residue in tx_status
Date: Tue, 13 Oct 2026 12:08:18 +0800
Message-ID: <20261013040818.464-1-wr574332525@163.com>
X-Mailer: git-send-email 2.53.0.windows.2
In-Reply-To: <20260928035133.2046-1-wr574332525@163.com>
References: <20260928035133.2046-1-wr574332525@163.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wC33w+zrs1qYTnbEA--.4316S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUejgxUUUUU
X-CM-SenderInfo: lzuvlkittskjqv6rljoofrz/xtbC9hXmf2rNrrUAbwAA3p

Hi Vinod and Frank,

Gentle ping on this patch. Please let me know if any further changes are
needed.

Thanks,
Rui

