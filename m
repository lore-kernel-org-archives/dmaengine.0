Received: from fsn-vps-1.bereza.email (fsn-vps-1.bereza.email [162.55.44.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6EF2405ADF;
	Wed,  1 Apr 2026 10:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.55.44.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775041183; cv=none; b=KoZld5vvA/2sP64xsN1S/V9spSVgFw/Tk3b07SJWo7YVvrYIlFSWbBqkIACCsQLm8i6TnpBYvIpiJsQOh7yujNcTzYDANibWy0DijI8WjoJzftijxuTHOiu8+8n3PPnjqC5DzjhNLY8Z38O5SzZqWLAi0O0HTA+VwsvRnr1wCXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775041183; c=relaxed/simple;
	bh=Mbj8DRjJ6FjmIEmUsBtCSoKyYAdXduQ+Y0GSwlGLOwo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=UX/W9KfAfK9SDmxbahb+eRlQWDyY1HhZDwkMGaUOK/Bj6DpzNAh3NRodbKhg0hDqgPXh/5EV4B1MVhvth84IHc8B8KQ1OnkSGlRNIoOpNYhfDXF7FZ9fiHEZ7maR4QRKw7H+02v2c8M12KVMuopoHN54W3Cmq4ocXQUj4fUAu98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bereza.email; spf=pass smtp.mailfrom=bereza.email; dkim=pass (2048-bit key) header.d=bereza.email header.i=@bereza.email header.b=V3z41BzU; arc=none smtp.client-ip=162.55.44.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bereza.email
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bereza.email
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bereza.email header.i=@bereza.email header.b="V3z41BzU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bereza.email; s=mail;
	t=1775041178; bh=Mbj8DRjJ6FjmIEmUsBtCSoKyYAdXduQ+Y0GSwlGLOwo=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=V3z41BzUUGsB5URRuoc25DYFE706Zgjp/NYPxzKAtlxQVrQGOHYrKUNQ140FHoUvA
	 wFoDASFqV1q8FwjJ3leJxmvLqW22IcX1BTKOu5hUFwJGoaOzjSKAFFD48dbxbvLkIC
	 UUO+nVlP/iDOoKleOBG6ATnkQmhKxEyFNGJiwi/AcFQPfiQWtAS6NNFvRfp/z7sK53
	 Ii+hoFfO3DLzUJpd9iJ6xdGOS/5OXY+9t609PExSKBLQf+J8QAX8Dk17UKqPjlFhmg
	 iepz9uU+ZMedubGBsGY47kUGw873saKDvQQFu7liDLupgyddHxMUCVkGUDmhSfgqBy
	 MrBp9lSm0cJDQ==
Received: from localhost (pd95bbad8.dip0.t-ipconnect.de [217.91.186.216])
	by fsn-vps-1.bereza.email (Postfix) with ESMTPSA id BAEF25DF94;
	Wed,  1 Apr 2026 12:59:37 +0200 (CEST)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Apr 2026 12:59:37 +0200
Message-Id: <DHHRKZLZFJ8Z.MKILHY9I70FK@bereza.email>
Cc: "Vinod Koul" <vkoul@kernel.org>, "Frank Li" <Frank.Li@kernel.org>,
 "Michal Simek" <michal.simek@amd.com>, "Ulf Hansson"
 <ulf.hansson@linaro.org>, "Arnd Bergmann" <arnd@arndb.de>, "Tony Lindgren"
 <tony@atomide.com>, "Kedareswara rao Appana" <appana.durga.rao@xilinx.com>,
 <dmaengine@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] dmaengine: xilinx_dma: Fix CPU stall in
 xilinx_dma_poll_timeout
From: "Alex Bereza" <alex@bereza.email>
To: "Geert Uytterhoeven" <geert@linux-m68k.org>, "Alex Bereza"
 <alex@bereza.email>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260401-fix-atomic-poll-timeout-regression-v2-0-68a265e3770f@bereza.email> <20260401-fix-atomic-poll-timeout-regression-v2-1-68a265e3770f@bereza.email> <ZORYRaMAXzaiiK2355T-MbuQTxDy1AU40-E3g_gXEej43XUE6jjbrMSWlOxrIU1uQuvxyxBkv7hyX8OMHBvoiA==@protonmail.internalid> <CAMuHMdWGHzt8nB3EGAToxZibf-O6C5xb9bcWhQQApzL3-6pcCA@mail.gmail.com>
In-Reply-To: <CAMuHMdWGHzt8nB3EGAToxZibf-O6C5xb9bcWhQQApzL3-6pcCA@mail.gmail.com>

Hi Geert,

thank you for the quick and helpful replies.

>> Fixes: 9495f2648287 ("dmaengine: xilinx_vdma: Use readl_poll_timeout ins=
tead of do while loop's")
>> Fixes: 7349a69cf312 ("iopoll: Do not use timekeeping in read_poll_timeou=
t_atomic()")
>>
>
> Please no blank line between tags.

Fixed. Sorry, was not aware of this formatting requirement.

BR
Alex
