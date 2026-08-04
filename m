Received: from fsn-vps-1.bereza.email (fsn-vps-1.bereza.email [162.55.44.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1806241D12F;
	Tue,  4 Aug 2026 07:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.55.44.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785828155; cv=none; b=sG/v4gg8YPjeSz6DTAqRoyV+g050U7LcHJqG1y74JnvCt1IYL99OD/vYhM/qClTbUI41RTqwEz3rmmkxJXisDecdiIwN4kFJuRhnWbp+3uP8leGkZ9ZyvKy3qFNBjCY+Uuht+0wNUvTSOzNocF/K8nb8mBk6tkqhpJToe7E3QqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785828155; c=relaxed/simple;
	bh=za/W1R0ep7nxOntbTWLBzDdMEq25zG+1KoYLZ6nWMzs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Y+F9aeur6mg+uq4QlI0N6c1XYb8Hy4TS5b8F/Blattdoy1udBLIJa4V8au+0S4qyta3zn3nb1Yo0KM33I4QNM4kZ1Ek8y1ZmKS4v8A44D0bftOa+AKwUkm3rNZFYXrAMqX12nahZLPg0q+ahIU9MmREhmZ356aCtDnC7KQj7gCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bereza.email; spf=pass smtp.mailfrom=bereza.email; dkim=pass (2048-bit key) header.d=bereza.email header.i=@bereza.email header.b=dQ8wW+YB; arc=none smtp.client-ip=162.55.44.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bereza.email
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bereza.email
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bereza.email header.i=@bereza.email header.b="dQ8wW+YB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bereza.email; s=mail;
	t=1785827549; bh=za/W1R0ep7nxOntbTWLBzDdMEq25zG+1KoYLZ6nWMzs=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=dQ8wW+YB1GEDP6dYSPPjbGUPbyBM4apdqsxDn77vD5/MrCUWfGI16KSvMXEh/C4qm
	 Rik+qDja03aS6+EBFqPWcK+uTZdv5XPao/6qkGdxRyelVBDhFpW7TKgY7a0rVvTuQy
	 vyWn93Olb6jNI6v7bf2dXFTSr1w9km+HOVTNXmq9qb6LG5V6aahOod6+5P+NDp8G4D
	 Blxx2tO5sh7CbhWUlK5KC0qZJ7JkQxji4DWTk1HkFcK2q5vUAJB+6L0OGSV4AWU94m
	 o49QOEtE+S7WWO/Wy5olIB2gnyZ52eFG6Qfv6iJVkUkNLiRq6ZKn0XHdbCQbWjOYiJ
	 MKeRRR6UW6Cag==
Received: from localhost (pd95bbad8.dip0.t-ipconnect.de [217.91.186.216])
	by fsn-vps-1.bereza.email (Postfix) with ESMTPSA id E523660085;
	Tue,  4 Aug 2026 09:12:28 +0200 (CEST)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 04 Aug 2026 09:12:28 +0200
Message-Id: <DKFZ162370HZ.2XC8HNVB1DU6H@bereza.email>
Cc: <dmaengine@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, "Vishal Sagar" <vishal.sagar@amd.com>
Subject: Re: [PATCH] dmaengine: xilinx_dma: Use readl_poll_timeout() instead
 of atomic variant
From: "Alex Bereza" <alex@bereza.email>
To: "Tomi Valkeinen" <tomi.valkeinen@ideasonboard.com>, "Vinod Koul"
 <vkoul@kernel.org>, "Frank Li" <Frank.Li@kernel.org>, "Michal Simek"
 <michal.simek@amd.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <UR3xiwNn0coPyYguDWjjQi-IWPyN8Surtot50IAldzugiznKwuwlVUScNRaQ1TMK5KEQcdglATeQVSWqQrsOuw==@protonmail.internalid> <20260803-xilinx-dma-poll-fix-v1-1-892302c4847d@ideasonboard.com>
In-Reply-To: <20260803-xilinx-dma-poll-fix-v1-1-892302c4847d@ideasonboard.com>

Hi Tomi,

seems your patch is not based off the current dmaengine tree. Please
have a look at
https://lore.kernel.org/dmaengine/20260402-fix-atomic-poll-timeout-regressi=
on-v4-0-f30d6a6c13cb@bereza.email/

BR
Alex
